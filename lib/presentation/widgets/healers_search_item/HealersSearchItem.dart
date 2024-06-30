import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:eduGate_flutter/data/models/teachers/teacherListModel/TeacherListResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../app/config/app_text_styles.dart';
import '../../../generated/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../pages/main/book_consultation/book_consultation_screen.dart';
import '../../pages/main/teachers/teacher_details/teacher_details.dart';

class HealersSearchItem extends StatelessWidget{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: AppColors.primary2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ));
  late AppLocalizations _local;
  doctor? doctor2;

  HealersSearchItem({required this.doctor2});

  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: (){
        Get.to(TeacherDetailsScreen(doctor2!.id.toString()));
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.white, width: 1.0,),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image:  DecorationImage(image: NetworkImage(doctor2!.avatar!),fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 220,
                            child: Row(
                              children: [
                                Text(doctor2?.fullName??"",style: TextStyle(fontSize: 14,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.dark1),),
                                Spacer(),
                                Text(doctor2?.teacherType??"",style: TextStyle(fontSize: 12,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dark3),),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5,),
                          SizedBox(
                            width: 200,
                            child: Text(doctor2?.bio??"",style: TextStyle(fontSize: 13,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                                color: AppColors.dark3),maxLines: 2,),
                          ),
                          const SizedBox(width: 5,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(Assets.imagesStarYello),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(doctor2?.rate??"",style: AppTextStyles.title2.copyWith(
                                  color: Colors.orange
                              ),),

                            ],
                          ),
                          const SizedBox(width: 5,),
                          SizedBox(
                            width: 220,
                            child: Row(
                              children: [
                                Text(((doctor2?.price45.toString())=="null"? "0.0":(doctor2?.price45.toString()))!+" " +_local.p_minute,style: TextStyle(fontSize: 12,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dark2),),
                                const Spacer(),
                                Text(((doctor2?.price45.toString())=="null"? "0.0":(doctor2?.price45.toString()))!+" " +_local.p_hour,style: TextStyle(fontSize: 12,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dark2),),
                              ],
                            ),
                          ),

                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(width: 10,),
              Container(
                width: 300,
                height: 50,
                margin: EdgeInsetsDirectional.only(
                    start: 8, end: 8, top: 8),
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Get.to(BookConsultationScreen(
                      userId: doctor2!.id!,
                      userName: doctor2!.fullName!,
                      userType: doctor2!.teacherType!,
                      userRate: doctor2!.rate!,
                      userImg: doctor2!.avatar!,
                      userPrice60: doctor2!.price45.toString()??"",
                      userPrice30: doctor2!.price30.toString()??"",
                    ),
                        duration: const Duration(
                            seconds: 0,
                            milliseconds:
                            300));
                  },
                  child: Text(_local.book_now,
                    style: TextStyle(fontSize: 14,
                        fontFamily: 'lexend_bold',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}