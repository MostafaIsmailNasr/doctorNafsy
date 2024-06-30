
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/base/base_controller/BaseController.dart';
import '../../../app/config/app_colors.dart';
import '../../../data/models/CreateConsultatModel/CreateConsultatResponse.dart';
import '../../../data/models/validateConsultatCouponeModel/validateConsultatCouponeResponse.dart';
import '../../../data/providers/web_servies/WebServies.dart';
import '../../../data/repositories/Redmee_points_repository.dart';
import '../../pages/home/parent_main_screen.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_toast/custom_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_binding.dart';

class PayConsultationController extends BaseController {
  PointsRepository repo = PointsRepository(WebService());
  TextEditingController codeController = TextEditingController();
  var validateConsultatCouponeResponse1 = validateConsultatCouponeResponse().obs;
  var createConsultatResponse = CreateConsultatResponse().obs;
  Rx<bool> isVisable = false.obs;
  var totalAfterDiscount=0.0.obs;
  var discount=0.0.obs;
  var discountId="".obs;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var total=0.0.obs;
  late AppLocalizations _local;

  validateConsultantCoupon()async{
    isLoading.value=true;
    validateConsultatCouponeResponse1.value = await repo.validateConsultantCoupon(codeController.text);
    if(validateConsultatCouponeResponse1.value.success==true){
      isLoading.value=false;
      isVisable.value=false;
      if(validateConsultatCouponeResponse1.value.data?.discountType=="fixed_amount"
      &&(validateConsultatCouponeResponse1.value.data!.amount!.toInt())<=total.value){
        discount.value=validateConsultatCouponeResponse1.value.data!.amount!.toDouble();
        totalAfterDiscount.value=(total.value-discount.value) ;
      }else if(validateConsultatCouponeResponse1.value.data?.discountType=="percentage"){
        discount.value=(total.value*((validateConsultatCouponeResponse1.value.data!.percent!)/100)) ;
        totalAfterDiscount.value=(total.value-discount.value) ;
      }
      showToast(validateConsultatCouponeResponse1.value.message.toString(),
          gravity: Toast.top,isSuccess: true);
    }else{
      isLoading.value=false;
      isVisable.value=false;
      showToast(validateConsultatCouponeResponse1.value.message.toString(),
          gravity: Toast.top,isSuccess: false);
    }
    return validateConsultatCouponeResponse1.value;
  }

  createConsultantOrder(int sessionDuration,
      String dateTime,int userId,BuildContext context)async{
    _local= AppLocalizations.of(context)!;
    isLoading2.value=true;
    createConsultatResponse.value = await repo.createConsultantOrder(sessionDuration,
        dateTime,userId,discount.value,totalAfterDiscount.value,
        (validateConsultatCouponeResponse1.value.data?.id.toString())??"");
    if(createConsultatResponse.value.success==true){
      isLoading2.value=false;
      successfullycheckedoutDialog(context);
    }else{
      isLoading2.value=false;
      showToast(createConsultatResponse.value.message!,
          gravity: Toast.top,isSuccess: false);
    }
  }

  successfullycheckedoutDialog(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(0),
        content: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset('assets/images/success5.svg'),
                const SizedBox(
                  height: 8,
                ),
                Text(_local.done_successfully,style: TextStyle(fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    color: AppColors.dark1),textAlign: TextAlign.center,),
                const SizedBox(
                  height: 8,
                ),
                Text(_local.the_consultation_booked,style: TextStyle(fontSize: 14,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark1),textAlign: TextAlign.center),
                const SizedBox(
                  height: 8,
                ),
                Center(
                    child: myButton(() {
                      //Get.to(HomePage(selectedIndex: 2,));
                      Get.offAll(ParentMainScreen(), binding: HomeBinding());
                    }, _local.homepage)
                )
              ],
            )));

    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

}