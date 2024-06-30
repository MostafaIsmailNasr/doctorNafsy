import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../data/repositories/teachers_repository.dart';
import '../../../../../domain/usecases/teachers_use_case.dart';
import '../../../../../generated/assets.dart';
import '../../../../controllers/teachers/teachers_controller.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../../../widgets/empty_widget/empty_widget.dart';
import '../../../../widgets/healers_search_item/HealersSearchItem.dart';
import '../../../../widgets/psychiatrists_item/PsychiatristsItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class TherapistScreen extends GetView<TeachersController>{
  late AppLocalizations _local;


  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    Future.delayed(Duration.zero, () {
      //your code goes here
      ToastMContext().init(context);
      controller.getTeacherList("therapist");
    });

    return Obx(() => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : PsychiatristsList(context));
  }

  Widget PsychiatristsList(BuildContext context){
    if(controller.doctorsList.isEmpty){
      return buildEmptyWidget(context,SvgPicture.asset(Assets.imagesNoInstructor),
          _local.there_is_no_teacher,
          _local.there_are_no_teachers_yet
      );
    }else{
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.doctorsList.length,
          itemBuilder: (context, position) {
            return PsychiatristsItem(
                null,
              controller.doctorsList[position],
              null,
              "teachers"
            );
          });
    }
  }
}