import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../data/repositories/teachers_repository.dart';
import '../../../../../domain/usecases/teachers_use_case.dart';
import '../../../../../generated/assets.dart';
import '../../../../controllers/consultingController/ConsultingController.dart';
import '../../../../controllers/teachers/teachers_controller.dart';
import '../../../../widgets/active_item/ActiveItem.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../../../widgets/empty_widget/empty_widget.dart';
import '../../../../widgets/healers_search_item/HealersSearchItem.dart';
import '../../../../widgets/psychiatrists_item/PsychiatristsItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../widgets/trainers_item/TrainersItem.dart';

class ActiveScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ActiveScreen();
  }
}

class _ActiveScreen extends State<ActiveScreen>{
  late AppLocalizations _local;
  final controller=Get.put(ConsultingController());
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.getConsultantsList("active");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    return Obx(() => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : activeList(context));
  }

  Widget activeList(BuildContext context){
    if(controller.consultantsList.isEmpty){
      return buildEmptyWidget(context,SvgPicture.asset(Assets.imagesNoInstructor),
          _local.there_is_no_consulting,
          _local.there_are_no_consulting_yet
      );
    }else{
      return ListView.builder(
        //  physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.consultantsList.length,
          itemBuilder: (context, position) {
            return ActiveItem(
              consultant: controller.consultantsList[position],
            );
          });
    }
  }
}