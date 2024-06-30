
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/config/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../controllers/auth/register_controller.dart';
import '../../../widgets/button.dart';
import '../../../widgets/choose_dialog/select_level_dialog.dart';
import '../../../widgets/custom_toast/custom_toast.dart';
import '../../../widgets/main_toolbar/main_toolbar.dart';
import '../../../widgets/textInput.dart';

enum dateGroup{male,female,other}
class RegisterScreen extends GetView<RegisterController> {
  late AppLocalizations _local;
  final _formKey = GlobalKey<FormState>();
  late double _height;
  late double _width;

  dateGroup date=dateGroup.male;


  RegisterScreen(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.isOnline.value == 0) {
        controller.registerRequest.organId = "2";
        //controller.getEducationLevels(2.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    ToastMContext().init(context);
    
    ToastMContext().init(context);
    _local = AppLocalizations.of(context)!;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;


    return Scaffold(
        resizeToAvoidBottomInset: true,
      appBar: buildMainToolBar(controller,
          "",
              () =>
          Get.back()
          ),
        body: Material(
      child: Container(
        height: _height,
        width: _width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: _height * 0.04,
                ),
                Text(
                    textAlign: TextAlign.start,
                    _local.create_an_account,
                    style: AppTextStyles.authTitleStyle),
                SizedBox(
                  height: _height * 0.05,
                ),
                getRowInput(_local.the_name, Assets.imagesUser,
                    controller: controller.nameTextController, (dynamic value) {
                      List<String> nameParts = value.trim().split(' ');
                  if (value == "") {
                    return _local.name_is_required;
                  }
                  else if (nameParts.length == 4) {
                      String firstName = nameParts[0];
                      String secondName = nameParts[1];
                      String thirdName = nameParts[2];
                      String lastName = nameParts[3];
                      String fullName =
                          '${firstName.trim()}${secondName != null ? ' ${secondName.trim()}' : ''}${thirdName != null ? ' ${thirdName.trim()}' : ''}${lastName != null ? ' ${lastName.trim()}' : ''}';
                      controller.nameTextController.text = fullName;


                  }else{
                    return  _local.enter_name_required;
                  }
                  return (!value!.isNotEmpty) ? _local.name_is_required : null;
                }),
                const SizedBox(height: 25),
                phoneNumber(),
                const SizedBox(height: 25),
                getRowInput(_local.email, Assets.assetsImagesEmail,
                    textInput: TextInputType.text,
                    controller: controller.EmailController,
                        (dynamic value) {
                      if (value == null) {
                        return _local.email_is_required;
                      }
                      return (!value!.isNotEmpty) ? _local.email_is_required : null;
                    }
                    ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => {
                    controller.PickStartTime2(context)
                  },
                  child:Obx(() {return getRowInput(
                      controller.strT.value!="" ?controller.strT.value:_local.governorate,
                      Assets.imagesBuliding,
                      controller: controller.governorateController,
                      (dynamic value) {
                    if (controller.strT.value == "") {
                      return _local.select_birthDate;
                    }
                  }, isEditable: false);
                })),
                // GestureDetector(
                //   onTap: () => {
                //
                //         dialogSelectBuilder(
                //             context,
                //             _local,
                //             _local.select_governorate,
                //             controller.governorateList,
                //             controller)
                //
                //   },
                //   child: getRowInput(_local.governorate, Assets.imagesBuliding,
                //       controller: controller.governorateController,
                //       (dynamic value) {
                //     if (value == null) {
                //       return _local.select_governorate;
                //     }
                //     return (!value!.isNotEmpty)
                //         ? _local.select_governorate
                //         : null;
                //   }, isEditable: false),
                // ),
                const SizedBox(height: 25),
              Obx(() =>   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Row(
                    children: [
                      Radio(
                        activeColor:AppColors.gray2,
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
                        activeColor:AppColors.gray2,
                        value: "female",
                        groupValue:controller.genderType.value,
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
                          activeColor:AppColors.gray2,
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
            // Obx(() =>controller.isOnline.value==1?     SizedBox(height: 25):Container()),
                    // Obx(() => controller.isOnline.value == 1
                    //     ? GestureDetector(
                    //         onTap: () => {
                    //               if (controller.registerRequest.cityId ==
                    //                       null ||
                    //                   controller
                    //                       .registerRequest.cityId!.isEmpty)
                    //                 {
                    //                   controller.showToast(
                    //                       _local.select_governorate,
                    //                       isSuccess: false),
                    //                 }
                    //               else
                    //                 {
                    //                   dialogSelectBuilder(
                    //                       context,
                    //                       _local,
                    //                       _local.select_education_level,
                    //                       controller.organizationList,
                    //                       controller)
                    //                 }
                    //             },
                    //         child: getRowInput(
                    //             _local.center, Assets.imagesEducation,
                    //             controller: controller.organizationController,
                    //             (dynamic value) {
                    //           if (value == null) {
                    //             return _local.select_center;
                    //           }
                    //           return (!value!.isNotEmpty)
                    //               ? _local.select_center
                    //               : null;
                    //         }, isEditable: false))
                    //     : Container()),

                // GestureDetector(
                //     onTap: () => {
                //           if (controller.registerRequest.organId == null ||
                //               controller.registerRequest.organId!.isEmpty)
                //             {
                //               controller
                //                   .showToast(_local.select_center,isSuccess: false),
                //             }
                //           else
                //             {
                //               dialogSelectBuilder(
                //                   context,
                //                   _local,
                //                   _local.select_education_level,
                //                   controller.educationLevelsList,
                //                   controller)
                //             }
                //         },
                //     child: getRowInput(
                //         _local.educational_level, Assets.imagesEducation,
                //         controller: controller.educationLevelController,
                //         (dynamic value) {
                //       if (value == null) {
                //         return _local.select_education_level;
                //       }
                //       return (!value!.isNotEmpty)
                //           ? _local.select_education_level
                //           : null;
                //     }, isEditable: false)),
                const SizedBox(height: 25),
                getRowInput(_local.enter_the_password, Assets.assetsImagesPass,
                    controller: controller.passController, (dynamic value) {
                  if (value == null) {
                    return _local.pass_is_required;
                  }
                  return (!value!.isNotEmpty) ? _local.pass_is_required : null;
                }, isPass: true),
                const SizedBox(height: 25),
                getRowInput(
                    _local.re_enter_the_password, Assets.assetsImagesPass,
                    controller: controller.passConfirmController,
                    (dynamic value) {
                  if (value == null) {
                    return _local.pass_is_required;
                  }
                  return (!value!.isNotEmpty) ? _local.pass_is_required : null;
                }, isPass: true),
                SizedBox(
                  height: _height * 0.04,
                ),
                myButton(() {
                  if (_formKey.currentState!.validate()) {
                    controller.hideKeyboard(context);
                    controller.register(context);
                  }
                  // Get.to(OtpScreen());
                }, _local.next),
                SizedBox(
                  height: _height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),)
    );


  }

  Widget getRowInput(
      String hint, String assetPrefex, FormFieldValidator? validator,
      {TextEditingController? controller,
      TextInputType textInput = TextInputType.text,
      bool isPass = false,
      bool isEditable = true}) {
    return MyTextFieldForm(
      assetNamePrefex: assetPrefex,
      hint: hint,
      textInput: textInput,
      maxLines: 1,
      isPass: isPass,
      isEditable: isEditable,
      textEditingController: controller,
      validator: validator,
      //  )
      //   ],
    );
  }

  Widget phoneNumber() {
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: controller.phoneController,
      maxLines: 1,
      validator: (value) {
        if (value == null) {
          return _local.phone_is_required;
        }else if(!value.startsWith("01")){
          return _local.phone_is_required;
        }
        return (!value!.isNotEmpty) ? _local.phone_is_required : null;
      },
      decoration: InputDecoration(
        prefixIcon: Container(
          margin: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(Assets.assetsImagesPhone),
              const SizedBox(
                width: 5,
              ),
              /*Obx(() => DropdownButton<String>(
                    underline: Container(),
                    value: controller.dropdownValue.value,
                    items: <String>[
                      '(+20)',
                      '(+966)',
                      '(+249)',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      controller.dropdownValue.value = newValue!;
                    },
                  )),*/
            ],
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide:
              BorderSide(color: Colors.black54, style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Colors.black54, style: BorderStyle.solid)),
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        hintText: _local.phone_number,
        hintStyle:  const TextStyle(color: Colors.grey),
      ),
      style: const TextStyle(color: Colors.grey),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11)
      ],
    );
  }
}
