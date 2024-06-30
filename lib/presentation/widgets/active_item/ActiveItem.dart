import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/config/app_text_styles.dart';
import '../../../data/models/consultationsoModel/ConsultantsResponse.dart';
import '../../../generated/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controllers/consultingDetailsController/ConsultingDetailsController.dart';
import '../../pages/main/consulting_details/consulting_details_screen.dart';

class ActiveItem extends StatelessWidget{
  late AppLocalizations _local;
  Consultant? consultant;
  final controller=Get.put(ConsultingDetailsController());

  ActiveItem({required this.consultant});

  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConsultingDetailsScreen(id: consultant!.id!)));
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: AppColors.dark4, width: 1.0,),
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
                    margin: const EdgeInsetsDirectional.only(start: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image:consultant!.doctor!.avatar!=null?
                      DecorationImage(image: NetworkImage(consultant!.doctor!.avatar!),fit: BoxFit.fill):
                      const DecorationImage(image: AssetImage('assets/images/doctor_logo_blue'),fit: BoxFit.fill)
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
                            width: 250,
                            child: Row(
                              children: [
                                Text(consultant!.doctor!.fullName??"",style: TextStyle(fontSize: 14,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.dark1),),
                                const Spacer(),
                                Text(consultant!.doctor!.teacherType??"",style: TextStyle(fontSize: 12,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dark3),),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(Assets.imagesCalendar5),
                              const SizedBox(width: 5,),
                              Text(consultant!.date??"",style: AppTextStyles.titleMo.copyWith(
                                  color: AppColors.dark2
                              ),),

                            ],
                          ),
                          const SizedBox(width: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(Assets.imagesClock3),
                                  const SizedBox(width: 5,),
                                  Text((consultant!.startTime??"")+" "+_local.to+" "+(consultant!.endTime??""),style: AppTextStyles.titleMo.copyWith(
                                      color: AppColors.dark2
                                  ),),
                                ],
                              ),
                              const SizedBox(width: 20,),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(Assets.imagesMoney2),
                                  const SizedBox(width: 5,),
                                  Text((consultant!.price.toString()??"")+" "+_local.egp,style: AppTextStyles.titleMo.copyWith(
                                      color: AppColors.primary2
                                  ),),

                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: ()async{
                              loading();
                              consultant?.meetingLink!=""?
                              await _openUrl(consultant?.meetingLink??""):null;
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(Assets.imagesVideo4),
                                const SizedBox(width: 5,),
                                SizedBox(
                                  width: 250,
                                  child: Text(consultant?.meetingLink!=""?
                                  consultant!.meetingLink! : _local.not_found,
                                    style: AppTextStyles.titleMo.copyWith(
                                        color: AppColors.primary2
                                    ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ),
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

            ],
          ),
        ),
      ),
    );
  }
  Future<void> _openUrl(String url) async {
    print("ooo "+url);
    print("ooo2 "+Uri.parse(url).toString());
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication,)) {
      throw Exception('Could not launch $url');
    }
    dismissLoading();
  }

  void loading() {
    EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
  }

  void dismissLoading() async {
    await EasyLoading.dismiss();
  }
}