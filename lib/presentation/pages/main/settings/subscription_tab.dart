import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

import '../../../../app/config/app_text_styles.dart';
import '../../../../app/util/util.dart';
import '../../../../generated/assets.dart';
import '../../../controllers/auth/register_controller.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_toast/custom_toast.dart';

class SubscriptionTab extends GetView<RegisterController> {
  late AppLocalizations _local;

  @override
  Widget build(BuildContext context) {
    ToastMContext().init(context);
    
    _local = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Form(
        child: Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                              _uploadImage(context);
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(15),
                            color: AppColors.primary2,
                            strokeWidth: 1,
                            dashPattern: [10,6],
                            child:Obx(() => controller.imageLicense.value!=null?
                            Container(
                              height:100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image:DecorationImage(image: FileImage(controller.imageLicense.value!),fit: BoxFit.fill),
                              ),)
                                :Container(
                              height:100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:Colors.white,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Assets.imagesCamerasmall,color: AppColors.primary),
                                    Text(
                                      _local.camera,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w600,
                                          color:AppColors.primary),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            uploadImageCar(context);
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(15),
                            color: AppColors.MainColor,//color of dotted/dash line
                            strokeWidth: 1, //thickness of dash/dots
                            dashPattern: [10,6],
                            child:Obx(() =>controller.imageCar.value!=null?
                            Container(
                              height:100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image:DecorationImage(image: FileImage(controller.imageCar.value!),fit: BoxFit.fill),
                              ),
                            ): Container(
                              height:100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:Colors.white,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Assets.imagesGallarysmall,color: AppColors.primary,),
                                    Text(
                                      _local.upload,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                Container(
                    margin: EdgeInsets.only(left: 10,right: 10,top: 15),
                    child: Text(_local.certificates_documents,style: AppTextStyles.title2,)),
                InkWell(
                  onTap: (){
                    uploadImage3(context);
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    color: AppColors.primary2,
                    strokeWidth: 1,
                    dashPattern: [10,6],
                    child:Obx(() => controller.imageCerrificates.value!=null?
                    Container(
                      height:100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image:DecorationImage(image: FileImage(controller.imageCerrificates.value!),fit: BoxFit.fill),
                      ),)
                        :Container(
                      height:100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.imagesGallarysmall,color: AppColors.primary),
                            Text(
                              _local.upload,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  color:AppColors.primary),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _uploadImage(BuildContext context) async {
    var pickedImage = await Utils.getImage(context, ImgSource.Both);;
    if (pickedImage != null){
      var imagePath = pickedImage.path;
      print("imagePath====>");
      print(imagePath);
      controller.imageLicense.value=File(imagePath);
    }
  }
  Future<void> uploadImageCar(BuildContext context) async {
    var pickedImage = await Utils.getImage(context, ImgSource.Both);;
    if (pickedImage != null){
      var imagePath = pickedImage.path;
      print("imagePath====>");
      print(imagePath);
      controller.imageCar.value=File(imagePath);
    }
  }

  Future<void> uploadImage3(BuildContext context) async {
    var pickedImage = await Utils.getImage(context, ImgSource.Both);;
    if (pickedImage != null){
      var imagePath = pickedImage.path;
      print("imagePath====>");
      print(imagePath);
      controller.imageCerrificates.value=File(imagePath);
    }
  }
}
