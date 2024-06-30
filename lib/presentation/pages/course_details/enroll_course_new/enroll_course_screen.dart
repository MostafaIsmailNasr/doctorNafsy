import 'package:eduGate_flutter/presentation/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../data/models/home/course_details/Course.dart';
import '../../../../generated/assets.dart';
import '../../../controllers/course_details/course_details_controller.dart';
import '../../../controllers/payConsultationController/PayConsultationController.dart';
import '../../../widgets/enroll_course_success/enroll_course_success.dart';
import '../../../widgets/main_toolbar/main_toolbar.dart';
import '../../../widgets/payment_item/PaymentItem.dart';
import '../../home/home_page.dart';


class EnrollCourseScreen extends GetView<CourseDetailsController> {
   //Course courseToBeEnrolled;
  var courseId;
  var coursePrice;
  late AppLocalizations _local;
  Rx<int>? selectedFlage = 0.obs;
  final _formKey = GlobalKey<FormState>();


   EnrollCourseScreen(this.courseId,this.coursePrice);

  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: buildMainToolBar(
          controller, _local.pay, () =>{
      controller.discount.value=0,
          controller.totalAfterDiscount.value=0,
        controller.couponTextController.clear(),
          Get.back()
      },
          isMenu: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(bottom: 20, start: 8, end: 8),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8, top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _local.enter_discount_code, style: TextStyle(fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark2),),
                    Row(
                      children: [
                        Expanded(flex: 2, child: code()),
                        Obx(() =>
                            Visibility(
                                visible: controller.isVisable.value,
                                child: CircularProgressIndicator(
                                  color: AppColors.MainColor,)
                            )),
                        Obx(() =>
                        controller.isVisable.value == true ?
                        Container() :
                        Expanded(
                          flex: 1,
                          child: myButton(
                                  () {
                                    if(_formKey.currentState!.validate()) {
                                      controller.isVisable.value = true;
                                      controller.validateCourseCoupon();
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
              padding: const EdgeInsetsDirectional.only(
                  bottom: 20, start: 8, end: 8),
              margin: const EdgeInsetsDirectional.only(
                  start: 8, end: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_local.choose_your_payment_method,
                    style: TextStyle(fontSize: 18,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark2),),
                  payment(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 20, start: 8, end: 8),
              margin: const EdgeInsetsDirectional.only(
                  start: 8, end: 8, bottom: 8),
              child:Obx(() =>  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_local.total, style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      Text(coursePrice.toString()+" "+_local.egp, style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_local.discount, style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      Text(controller.discount.value.toString()+" "+_local.egp, style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_local.total_after, style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      Text(controller.totalAfterDiscount.value==0.0?
                      coursePrice.toString()+" "+_local.egp
                          :controller.totalAfterDiscount.value.toString()+" "+_local.egp,
                      style: TextStyle(fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                    ],
                  ),
                ],
              )),
            ),
            myButton(() {
              // successfullycheckedoutDialog(context);
              controller.checkoutCourse(
                  controller.couponTextController.text.toString(),
                  controller.discountId.value,controller.courseDetails.value!.price!.toString(),
                  controller.discount.value.toString(),
                  controller.totalAfterDiscount.value.toString());
              // controller.checkCartData(
              //     CheckCartType.check);
              //dialogSuccessErrorEnrollBuilder(context, type: 1);
            }, _local.subscrip)
          ],
        ),
      ),
    );
  }

  Widget code() {
    return SizedBox(
      width: 200,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller.couponTextController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _local.please_enter_code;
          }
          return null;
        },
        maxLines: 1,
        decoration: InputDecoration(filled: true,
          fillColor: Colors.white,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red, style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color: AppColors.dark4, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                style: BorderStyle.solid, color: AppColors.dark4,)
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red, style: BorderStyle.solid),
          ),
          hintText: _local.discount_code_here,
          hintStyle: TextStyle(fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              color: AppColors.dark3),
        ),
        style: TextStyle(fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w300,
            color: AppColors.dark3),
      ),
    );
  }

  Widget payment() {
    return Obx(() =>  ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
      children: [
        PaymentItem(
            img: 'assets/images/visa6.png',
            title: _local.visa,
            subTitle: _local.you_can_pay_via_visa,
            selected: selectedFlage!.value == 0,
            onTap: () =>
            {
              //setState(() {
              selectedFlage!.value = 0
              //})
            }
        ),
        PaymentItem(
            img: 'assets/images/mada.png',
            title: _local.mada,
            subTitle: _local.you_can_pay_via_mada,
            selected: selectedFlage!.value == 1,
            onTap: () =>
            {
              // setState(() {
              selectedFlage!.value = 1
              // })
            }
        ),
        PaymentItem(
            img: 'assets/images/pay_pal.png',
            title: _local.pay_pal,
            subTitle: _local.you_can_pay_via_payPal,
            selected: selectedFlage!.value == 2,
            onTap: () =>
            {
              // setState(() {
              selectedFlage!.value = 2
              // })
            }
        ),
        PaymentItem(
            img: 'assets/images/apple.png',
            title: _local.apple_pay,
            subTitle: _local.you_can_pay_via_apple_pay,
            selected: selectedFlage == 3,
            onTap: () =>
            {
              // setState(() {
              selectedFlage!.value = 3
              // })
            }
        ),
      ],
    ));
  }

}

