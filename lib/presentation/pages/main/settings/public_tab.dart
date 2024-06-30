import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../controllers/auth/register_controller.dart';
import '../../../widgets/choose_dialog/select_level_dialog.dart';
import '../../../widgets/custom_toast/custom_toast.dart';
import '../../auth/login/login_screen.dart';

class PublicTab extends GetView<RegisterController> {

  late AppLocalizations _local;

  @override
  Widget build(BuildContext context) {
    ToastMContext().init(context);
    
    _local = AppLocalizations.of(context)!;
    print("0000000");
    Future.delayed(const Duration()).then((_) async {
      controller.bindData();
    });
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Form(
        key: controller.formKey,
        child: Container(
          margin: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getRowInput(_local.the_name, _local.the_name, controller.nameTextController,
                      (dynamic value) {
                if (value == null) {
                  return _local.name_is_required;
                }
                return (!value!.isNotEmpty) ? _local.name_is_required : null;
              }),
              const SizedBox(height: 25),
              getRowInput(_local.phone_number, "01xxxxxxxxx", controller.phoneController,
                      (dynamic value) {
                if (value == null) {
                  return _local.phone_is_required;
                }
                return (!value!.isNotEmpty) ? _local.phone_is_required : null;
              },isEditable:false),
              const SizedBox(height: 25),
              getRowInput(_local.email, _local.email, controller.EmailController,
                      (dynamic value) {
                if (value == null) {
                  return _local.email_is_required;
                }
                return (!value!.isNotEmpty) ? _local.email_is_required : null;
              }),
              const SizedBox(height: 25),
              GestureDetector(
                  onTap: () => {
                    controller.PickStartTime2(context),
                    //controller.strT.value==""
                  },
                  child:Obx(() {
                    return getRowInput(
                        assetPrefex: Assets.assetsCalendar88,
                        _local.governorate,
                        controller.strT.value!=""?controller.strT.value:_local.governorate,
                        controller.governorateController,
                            (dynamic value) {
                      if (controller.strT.value == "") {
                        return _local.select_birthDate;
                      }
                    }, isEditable: false);
                  })),
              /*GestureDetector(
                onTap: () => {

                  dialogSelectBuilder(
                      context,
                      _local,
                      _local.select_governorate,
                      controller.governorateList,
                      controller)

                },
                child: getRowInput(_local.governorate, _local.governorate,
                   controller.governorateController,
                        (dynamic value) {
                      if (value == null) {
                        return _local.select_governorate;
                      }
                      return (!value!.isNotEmpty)
                          ? _local.select_governorate
                          : null;
                    }, isEditable: false),
              ),*/
              const SizedBox(height: 25),
              Text(
                _local.type,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.title
                      .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray)),
              const SizedBox(
                height: 5,
              ),
              Obx(() =>   Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        activeColor:AppColors.primary,
                        value: "male",
                        groupValue: controller.genderType.value,
                        onChanged: (value){
                          controller.isOnline.value=0;
                          controller.genderType.value="male";
                          controller.registerRequest.organId="2";
                          controller.registerRequest.groupId ="";
                          controller.educationLevelController.text="";
                          //controller.getEducationLevels(2.toString());
                        },),
                      const SizedBox(width: 5,),
                      Text(_local.online)
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor:AppColors.primary,
                        value: "female",
                        groupValue: controller.genderType.value,
                        onChanged: (value){
                          controller.isOnline.value=1;
                          controller.genderType.value="female";
                          controller.registerRequest.organId="";
                          controller.organizationController.text = "";
                          controller.educationLevelController.text = "";
                          controller.registerRequest.organId = "";
                          controller.registerRequest.groupId = "";
                          // if(((controller.registerRequest.cityId??"").toString()).isNotEmpty){
                          //   controller.getOrganizations(controller.registerRequest.cityId.toString());
                          // }
                        },
                      ),
                      const SizedBox(width: 5,),
                      Text(_local.center)
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor:AppColors.primary,
                        value: "other",
                        groupValue: controller.genderType.value,
                        onChanged: (value){
                          controller.isOnline.value=2;
                          controller.genderType.value="other";
                          controller.registerRequest.organId="";
                          controller.organizationController.text = "";
                          controller.educationLevelController.text = "";
                          controller.registerRequest.organId = "";
                          controller.registerRequest.groupId = "";
                          // if(((controller.registerRequest.cityId??"").toString()).isNotEmpty){
                          //   controller.getOrganizations(controller.registerRequest.cityId.toString());
                          // }
                        },
                      ),
                      const SizedBox(width: 5,),
                      Text(_local.i_prefer_not_to_say)
                    ],
                  ),
                ],)),
              ///
             /* Obx(() =>   Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RadioListTile(
                      activeColor: AppColors.primary,
                      title: Text(_local.online),
                      value: 0,
                      groupValue: controller.isOnline.value,
                      onChanged: (value){
                        controller.isOnline.value=0;
                        controller.registerRequest.organId="2";
                        controller.registerRequest.groupId ="";
                        controller.educationLevelController.text="";
                        controller.getEducationLevels(0.toString());
                      },
                    ),
                  ),

                  Expanded(
                    child: RadioListTile(
                      activeColor: AppColors.primary,
                      title: Text(_local.center),
                      value: 1,
                      groupValue: controller.isOnline.value,
                      onChanged: (value){
                        controller.isOnline.value=1;
                        controller.registerRequest.organId="";
                        controller.organizationController.text = "";
                        controller.educationLevelController.text = "";
                        controller.registerRequest.organId = "";
                        controller.registerRequest.groupId = "";
                        if(((controller.registerRequest.cityId??"").toString()).isNotEmpty){
                          controller.getOrganizations(controller.registerRequest.cityId.toString());
                        }
                      },
                    ),
                  ),
                ],)),*/
              /*Obx(() =>controller.isOnline.value==1?     SizedBox(height: 25):Container()),
              Obx(() =>controller.isOnline.value==1?   GestureDetector(
                  onTap: () => {
                    if (controller.registerRequest.cityId == null ||
                        controller.registerRequest.cityId!.isEmpty)
                      {
                        controller
                            .showToast(_local.select_governorate,isSuccess: false),
                      }
                    else
                      {
                        dialogSelectBuilder(
                            context,
                            _local,
                            _local.select_center,
                            controller.organizationList,
                            controller)
                      }
                  },
                  child: getRowInput(
                      _local.center,  _local.center,
                       controller.organizationController,
                          (dynamic value) {
                        if (value == null) {
                          return _local.select_center;
                        }
                        return (!value!.isNotEmpty)
                            ? _local.select_center
                            : null;
                      }, isEditable: false)):Container()),
             SizedBox(height: 25),
              GestureDetector(
                  onTap: () => {
                    if (controller.registerRequest.organId == null ||
                        controller.registerRequest.organId!.isEmpty)
                      {
                        controller
                            .showToast(_local.select_center,isSuccess: false),
                      }
                    else
                      {
                        dialogSelectBuilder(
                            context,
                            _local,
                            _local.select_education_level,
                            controller.educationLevelsList,
                            controller)
                      }
                  },
                  child: getRowInput(
                      _local.educational_level, _local.educational_level,
                       controller.educationLevelController,
                          (dynamic value) {
                        if (value == null) {
                          return _local.select_education_level;
                        }
                        return (!value!.isNotEmpty)
                            ? _local.select_education_level
                            : null;
                      }, isEditable: false)),*/

            ],
          ),
        ),
      ),
    );
  }
}
