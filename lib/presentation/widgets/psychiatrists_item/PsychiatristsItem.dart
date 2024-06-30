import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:eduGate_flutter/data/models/search/SearchListModel/SearchListResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../app/config/app_text_styles.dart';
import '../../../data/models/home/newHomeModel/HomeListResponse.dart';
import '../../../data/models/teachers/Teachers.dart';
import '../../../data/models/teachers/teacherListModel/TeacherListResponse.dart';
import '../../../generated/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controllers/course_details/course_details_binding.dart';
import '../../controllers/teachers/teachers_binding.dart';
import '../../pages/main/book_consultation/book_consultation_screen.dart';
import '../../pages/main/teachers/teacher_details/teacher_details.dart';

class PsychiatristsItem extends StatelessWidget{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: AppColors.primary2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ));
  late AppLocalizations _local;
  Therapists? therapists;
  String? from;
  doctor? doctor2;
  Teachers3? search;
  PsychiatristsItem(this.therapists,this.doctor2,this.search ,this.from);

  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    if(from=="teachers"){
      return GestureDetector(
        onTap: (){
          Get.to(TeacherDetailsScreen(doctor2!.id.toString()),binding:
          TeachersBinding());
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
                        image: doctor2!.avatar==null?
                        DecorationImage(image:  AssetImage('assets/images/doctor_logo_blue.png')):
                        DecorationImage(image: NetworkImage(doctor2!.avatar!),fit: BoxFit.fill),
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
                                  const Spacer(),
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
                                  Text(((doctor2?.price30.toString())=="null"? "0.0":(doctor2?.price30.toString()))!+" " +_local.p_minute,style: TextStyle(fontSize: 12,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark2),),
                                  Spacer(),
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
                  margin: const EdgeInsetsDirectional.only(
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
                        userPrice30: doctor2!.price30!.toString(),
                        userPrice60: doctor2!.price45!.toString(),
                      ),
                          duration: const Duration(
                              seconds: 0,
                              milliseconds:
                              300));
                    },
                    child: Text(_local.book_now,
                      style: const TextStyle(fontSize: 14,
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
    else if(from=="search"){
      return GestureDetector(
        onTap: (){
          Get.to(TeacherDetailsScreen(search!.id.toString()),binding:
          TeachersBinding());
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
                        image: search!.avatar==null?
                        DecorationImage(image:  AssetImage('assets/images/doctor_logo_blue.png')):
                        DecorationImage(image: NetworkImage(search!.avatar!),fit: BoxFit.fill),
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
                                  Text(search?.fullName??"",style: TextStyle(fontSize: 14,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.dark1),),
                                  const Spacer(),
                                  Text(search?.teacherType??"",style: TextStyle(fontSize: 12,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark3),),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5,),
                            SizedBox(
                              width: 200,
                              child: Text(search?.bio??"",style: TextStyle(fontSize: 13,
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
                                Text(search?.rate??"",style: AppTextStyles.title2.copyWith(
                                    color: Colors.orange
                                ),),

                              ],
                            ),
                            const SizedBox(width: 5,),
                            SizedBox(
                              width: 220,
                              child: Row(
                                children: [
                                  Text(((search?.price30.toString())=="null"? "0.0":(search?.price30.toString()))!+" " +_local.p_minute,style: TextStyle(fontSize: 12,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark2),),
                                  Spacer(),
                                  Text(((search?.price45.toString())=="null"? "0.0":(search?.price45.toString()))!+" " +_local.p_hour,style: TextStyle(fontSize: 12,
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
                  margin: const EdgeInsetsDirectional.only(
                      start: 8, end: 8, top: 8),
                  child: TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Get.to(BookConsultationScreen(
                        userId: search!.id!,
                        userName: search!.fullName!,
                        userType: search!.teacherType!,
                        userRate: search!.rate!,
                        userImg: search!.avatar!,
                        userPrice30: search!.price30!.toString(),
                        userPrice60: search!.price45!.toString(),
                      ),
                          duration: const Duration(
                              seconds: 0,
                              milliseconds:
                              300));
                    },
                    child: Text(_local.book_now,
                      style: const TextStyle(fontSize: 14,
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
    else{
      return GestureDetector(
        onTap: (){
          Get.to(TeacherDetailsScreen(therapists!.id.toString()),binding:
          TeachersBinding());
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
                        image: therapists!.avatar==null?
                        DecorationImage(image:  AssetImage('assets/images/doctor_logo_blue.png')):
                        DecorationImage(image: NetworkImage(therapists?.avatar),fit: BoxFit.fill),
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
                                  Text(therapists?.fullName??"",style: TextStyle(fontSize: 14,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.dark1),),
                                  const Spacer(),
                                  Text(therapists?.teacherType??"",style: TextStyle(fontSize: 12,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark3),),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5,),
                            SizedBox(
                              width: 200,
                              child: Text(therapists?.bio??"",style: TextStyle(fontSize: 13,
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
                                Text(therapists?.rate??"",style: AppTextStyles.title2.copyWith(
                                    color: Colors.orange
                                ),),

                              ],
                            ),
                            const SizedBox(width: 5,),
                            SizedBox(
                              width: 220,
                              child: Row(
                                children: [
                                  Text(((therapists?.price30.toString())=="null"? "0.0":(therapists?.price30.toString()))!+" " +_local.p_minute,style: TextStyle(fontSize: 12,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark2),),
                                  Spacer(),
                                  Text(((therapists?.price45.toString())=="null"? "0.0":(therapists?.price45.toString()))!+" " +_local.p_hour,style: TextStyle(fontSize: 12,
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
                  margin: const EdgeInsetsDirectional.only(
                      start: 8, end: 8, top: 8),
                  child: TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Get.to(BookConsultationScreen(
                        userId: therapists!.id!,
                        userName: therapists!.fullName!,
                        userType: therapists!.teacherType!,
                        userRate: therapists!.rate!,
                        userImg: therapists!.avatar!,
                        userPrice30: therapists!.price30!.toString(),
                        userPrice60: therapists!.price45!.toString(),
                      ),
                          duration: const Duration(
                              seconds: 0,
                              milliseconds:
                              300));
                    },
                    child: Text(_local.book_now,
                      style: const TextStyle(fontSize: 14,
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

}