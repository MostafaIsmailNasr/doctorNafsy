import 'package:eduGate_flutter/presentation/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../controllers/payConsultationController/PayConsultationController.dart';
import '../../../widgets/main_toolbar/main_toolbar.dart';
import '../../../widgets/payment_item/PaymentItem.dart';
import '../../home/home_page.dart';


class PayConsultationScreen extends StatefulWidget{
  String userImg,userName,userType,dateTime,price;
  int sessionDuration,userId;

  PayConsultationScreen({required this.userImg,
    required this.userName,
    required this.userType,
    required this.dateTime,
    required this.price,
    required this.sessionDuration,
    required this.userId});

  @override
  State<StatefulWidget> createState() {
    return _PayConsultationScreen();
  }
}

class _PayConsultationScreen extends State<PayConsultationScreen>{
  late AppLocalizations _local;
  int? selectedFlage=0;
  final _formKey = GlobalKey<FormState>();
  final controller=Get.put(PayConsultationController());
  @override
  void initState() {
    controller.total.value=double.parse(widget.price);
    controller.totalAfterDiscount.value=double.parse(widget.price);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: buildMainToolBar(
          controller, _local.pay, () => Get.back(),
          isMenu: false),
      body:Obx(() => !controller.isLoading2.value? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(top: 20,bottom: 20,start: 8,end: 8),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8,top: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: AppColors.dark4, width: 1.0,),
                  color: Colors.white),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsetsDirectional.only(start: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image:  widget.userImg==null?
                      const DecorationImage(image:  AssetImage('assets/images/doctor_logo_blue.png')):
                      DecorationImage(image: NetworkImage(widget.userImg),fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Row(
                          children: [
                            Text(widget.userName??"",style: TextStyle(fontSize: 14,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w700,
                                color: AppColors.dark1),),
                            const Spacer(),
                            Text(widget.userType??"",style: TextStyle(fontSize: 12,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                                color: AppColors.dark2),),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/calendar2.svg',color: AppColors.green,),
                          const SizedBox(width: 5,),
                          Text(widget.dateTime??"",style: TextStyle(fontSize: 14,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              color: AppColors.green),),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(bottom: 20,start: 8,end: 8),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8,top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_local.enter_discount_code,style: TextStyle(fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark2),),
                    Row(
                      children: [
                        Expanded(flex: 2,child: code()),
                        Obx(() =>
                            Visibility(
                                visible: controller.isVisable.value,
                                child:  CircularProgressIndicator(color: AppColors.MainColor,)
                            )),
                        Obx(() =>   controller.isVisable.value==true?
                        Container():
                        Expanded(
                          flex: 1,
                          child: myButton(
                                  () {
                                    if(_formKey.currentState!.validate()) {
                                      controller.isVisable.value = true;
                                      controller.validateConsultantCoupon();
                                    }
                                  },
                              _local.apply,
                              isFilled: false),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(bottom: 20,start: 8,end: 8),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_local.choose_your_payment_method,style: TextStyle(fontSize: 18,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark2),),
                  payment(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(bottom: 20, start: 8, end: 8),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
              child:Obx(() => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_local.subtotal,style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      Text((widget.price.toString()??"")+" "+_local.egp,style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_local.transfer_fees,style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      Text(controller.discount.value.toString()+" "+_local.egp,style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_local.total,style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      Text(controller.totalAfterDiscount.value.toString()+" "+_local.egp,style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                    ],
                  ),
                ],
              )),
            ),
            myButton(() {
              controller.createConsultantOrder(widget.sessionDuration,widget.dateTime,widget.userId,context);
              //successfullycheckedoutDialog(context);
            }, _local.pay)
          ],
        ),
      ):Center(child: CircularProgressIndicator(color: AppColors.primary,))),
    );

  }

  Widget code (){
    return SizedBox(
      width: 200,
      child: TextFormField(
        autovalidateMode:AutovalidateMode.onUserInteraction ,
        controller: controller.codeController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _local.please_enter_code;
          }
          return null;
        },
        maxLines: 1,
        decoration: InputDecoration(filled: true,fillColor: Colors.white,
          errorBorder:  const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColors.dark4,style: BorderStyle.solid),
          ),
          focusedBorder:  OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(style: BorderStyle.solid,color:AppColors.dark4,)
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
          ) ,
          hintText: _local.discount_code_here,
          hintStyle:  TextStyle(fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              color: AppColors.dark3),
        ),
        style:  TextStyle(fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w300,
            color: AppColors.dark3),
      ),
    );
  }

  Widget payment(){
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
      children: [
        PaymentItem(
          img: 'assets/images/visa6.png',
            title: _local.visa,
            subTitle: _local.you_can_pay_via_visa,
            selected: selectedFlage==0,
            onTap:  ()=>{
              setState(() {
                selectedFlage=0;
              })
            }
        ),
        PaymentItem(
            img: 'assets/images/mada.png',
            title: _local.mada,
            subTitle: _local.you_can_pay_via_mada,
            selected: selectedFlage==1,
            onTap:  ()=>{
              setState(() {
                selectedFlage=1;
              })
            }
        ),
        PaymentItem(
            img: 'assets/images/pay_pal.png',
            title: _local.pay_pal,
            subTitle: _local.you_can_pay_via_payPal,
            selected: selectedFlage==2,
            onTap:  ()=>{
              setState(() {
                selectedFlage=2;
              })
            }
        ),
        PaymentItem(
            img: 'assets/images/apple.png',
            title: _local.apple_pay,
            subTitle: _local.you_can_pay_via_apple_pay,
            selected: selectedFlage==3,
            onTap:  ()=>{
              setState(() {
                selectedFlage=3;
              })
            }
        ),
      ],
    );
  }

}