import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../app/config/app_text_styles.dart';
import '../../../data/models/home/newHomeModel/HomeListResponse.dart';
import '../../../generated/assets.dart';
import '../../controllers/teachers/teachers_binding.dart';
import '../../pages/main/teachers/teacher_details/teacher_details.dart';

class AvailableDoctorItem extends StatelessWidget{
  final Doctors? doctors;

  AvailableDoctorItem({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(TeacherDetailsScreen(doctors!.id.toString()),binding:
        TeachersBinding());
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 8,end:8,bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: doctors!.avatar==null?
            const DecorationImage(image:  AssetImage('assets/images/doctor_logo_blue.png')):
            DecorationImage(image: NetworkImage(doctors!.avatar),fit: BoxFit.fill)
        ),
        child: Stack(
          children: [
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(image: AssetImage('assets/images/shadow.png',),fit: BoxFit.fill)//:
              ),
            ),
            Positioned(
              bottom: 6,
              left: 5,
              right: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.imagesStarYello),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(doctors?.rate??"",style: AppTextStyles.title2.copyWith(
                          color: Colors.orange
                      ),),
                    ],
                  ),
                   Text(doctors?.fullName??"",style: const TextStyle(fontSize: 14,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),),
                   Text(doctors?.teacherType??"",style: const TextStyle(fontSize: 12,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      color: Colors.white),),
                   Text(doctors?.bio??"",style: const TextStyle(fontSize: 12,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      color: Colors.white),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}