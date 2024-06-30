import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:eduGate_flutter/presentation/pages/main/consulting_details/web_view/custom_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_zoom_videosdk/native/zoom_videosdk.dart';
// import 'package:flutter_zoom_videosdk/native/zoom_videosdk_event_listener.dart';
// import 'package:flutter_zoom_videosdk/native/zoom_videosdk_user.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_app_webview/in_app_webview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../main.dart';
import '../../../controllers/consultingDetailsController/ConsultingDetailsController.dart';
import '../../../widgets/custom_toast/custom_toast.dart';
import '../../../widgets/main_toolbar/main_toolbar.dart';
import '../../../widgets/rate_bar/rate_bar.dart';

class ConsultingDetailsScreen extends StatefulWidget{
  int id;

  ConsultingDetailsScreen({required this.id});

  @override
  State<StatefulWidget> createState() {
    return _ConsultingDetailsScreen();
  }
}

class _ConsultingDetailsScreen extends State<ConsultingDetailsScreen>{
  late AppLocalizations _local;
  late double _height;
  late double _width;
  final controller=Get.put(ConsultingDetailsController());

  @override
  void initState() {
    controller.getConsultantsList(widget.id);
    // final apiKey = 'DIRLb62XRtOm6YD6Bv5Ltg';
    // final apiSecret = '6DXqB3KAwNIUOFAxflqqpTsIgrcSnAUa';
    // final sessionName = '71878749797'; // Replace with your session name
    // final zoomToken = generateZoomToken(apiKey, apiSecret, sessionName);
    // controller.sessionToken=zoomToken;
    //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBfa2V5IjoiRElSTGI2MlhSdE9tNllENkJ2NUx0ZyIsInJvbGVfdHlwZSI6MCwidHBjIjoiODQyOTAwNTc0NjgiLCJ2ZXJzaW9uIjoxLCJpYXQiOjE3MDg1MTkxNzAsImV4cCI6MTcwODUyMjc3MH0.PIpYjgtE-07sD-XU1BilXHjVmvZBA1iKQrzs4YV8l-c";//;
    //print('Zoom Token: $zoomToken');
    super.initState();
  }

  String generateZoomToken(String apiKey, String apiSecret, String sessionName) {
    final Map<String, dynamic> claims = {
      'appKey': apiKey,
      'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'exp': DateTime.now().add(const Duration(minutes: 15)).millisecondsSinceEpoch ~/ 1000,
      'tokenExp': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch ~/ 1000,
      'version': 1,
      'role_type':0,
      'user_identity':"BNmh-fHmRWmnCiL1832MDg",
      'user': {
        'id': "start.walid.1@gmail.com",
        'name': "walid",
      },
      'tpc': sessionName,
    };

    final String encodedHeader = base64Url.encode(utf8.encode(json.encode({'alg': 'HS256', 'typ': 'JWT'})));
    final String encodedClaims = base64Url.encode(utf8.encode(json.encode(claims)));

    final String signatureInput = '$encodedHeader.$encodedClaims';

    // Use the crypto package to compute the Hmac SHA-256 hash
    final hmac = Hmac(sha256, utf8.encode(apiSecret));
    final Digest signature = hmac.convert(utf8.encode(signatureInput));
    final String signatureBase64 = base64Url.encode(signature.bytes);

    return '$signatureInput.$signatureBase64';
  }

  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: buildMainToolBar(controller,
          _local.consultation_details,
              () => Get.back(),isMenu: false),
      body: Obx(() => !controller.isLoading.value? SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(top: 20,bottom: 20,start: 8,end: 8),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8,top: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: AppColors.dark4, width: 1.0,),
                  color: Colors.white),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsetsDirectional.only(start: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image:  controller.consultantsDetailsResponse.value.data?.doctor!.avatar!=null?
                      DecorationImage(image: NetworkImage(controller.consultantsDetailsResponse.value.data!.doctor!.avatar!),fit: BoxFit.fill):
                      const DecorationImage(image: AssetImage('assets/images/doctor_logo_blue'),fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(controller.consultantsDetailsResponse.value.data?.doctor?.fullName??"",
                        style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                      Text(controller.consultantsDetailsResponse.value.data?.doctor?.teacherType??""
                        ,style: TextStyle(fontSize: 12,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark2),),
                    ],
                  ),
                  const Spacer(),
                  StarRating(
                    rating: double.parse(controller.consultantsDetailsResponse.value.data?.doctor?.rate??"0"),
                    onRatingChanged: (rating) =>
                    {} /* setState(() => this.rating = rating)*/,
                    color: AppColors.yello,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8,top: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 80,
                        padding: const EdgeInsetsDirectional.all(8),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: AppColors.dark4, width: 1.0,),
                            color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/video4.svg',color: AppColors.dark1,width: 30,height: 30,),
                            const SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_local.service,style: TextStyle(fontSize: 14,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.dark3),),
                                Text(controller.consultantsDetailsResponse.value.data?.service??"",style: TextStyle(fontSize: 12,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dark1),),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                      child: Container(
                        height: 80,
                        padding: const EdgeInsetsDirectional.all(8),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: AppColors.dark4, width: 1.0,),
                            color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/money.svg',color: AppColors.dark1,width: 30,height: 30,),
                            const SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_local.service_price,style: TextStyle(fontSize: 14,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.dark3),),
                                Text((controller.consultantsDetailsResponse.value.data?.price.toString()??"")+" "+_local.egp,style: TextStyle(fontSize: 12,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dark1),),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8, top: 20),
              padding: const EdgeInsetsDirectional.all(12),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: AppColors.dark4, width: 1.0,),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(_local.date,style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      const Spacer(),
                      Text(controller.consultantsDetailsResponse.value.data?.date??"",style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark1),),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(_local.time,style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      const Spacer(),
                      Text((controller.consultantsDetailsResponse.value.data?.startTime??"")+" "+_local.to+" "+(controller.consultantsDetailsResponse.value.data?.endTime??""),style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark1),),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  /*Row(
                    children: [
                      Text(_local.reservation_type,style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      const Spacer(),
                      Text("فردي",style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark1),),
                    ],
                  ),*/
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(_local.duration_session,style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      const Spacer(),
                      Text((controller.consultantsDetailsResponse.value.data?.sessionDuration??"")+" "+_local.minutes3,style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark1),),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(_local.payment_method,style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark3),),
                      const Spacer(),
                      Text(controller.consultantsDetailsResponse.value.data?.payment??"",style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark1),),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8, top: 20),
               padding: const EdgeInsetsDirectional.all(12),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: AppColors.dark4,
                    width: 1.0,),
                  color: AppColors.primary),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/video4.svg',color: Colors.white,width: 30,height: 30,),
                  const SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 280,
                        child: Row(
                          children: [
                            Text(_local.booking_link,style: TextStyle(fontSize: 14,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                                color: AppColors.dark4),),
                            const Spacer(),
                             InkWell(
                               onTap: (){
                                 if(controller.consultantsDetailsResponse.value.data?.meetingLink!=""){
                                   Clipboard.setData( ClipboardData(text: controller.consultantsDetailsResponse.value.data!.meetingLink!));
                                   showToast(_local.copied_successfully,
                                       gravity: Toast.top, isSuccess: true);
                                 }
                               },
                                 child: const Icon(Icons.copy,color: Colors.white,))
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                       InkWell(
                         onTap: ()async{
                           loading();
                           controller.consultantsDetailsResponse.value.data?.meetingLink!=""?
                           _openUrl(controller.consultantsDetailsResponse.value.data!.meetingLink!):null;
                           /*var zoom = ZoomVideoSdk();
                           InitConfig initConfig = InitConfig(
                             appGroupId: "group.test.sdk",//"29591"
                             domain: "zoom.us",
                             enableLog: false,
                           );
                           await zoom.initSdk(initConfig);

                           //var eventListener = ZoomVideoSdkEventListener();

                           Map<String, bool> SDKaudioOptions = {
                             "connect": true,
                             "mute": true
                           };
                           Map<String, bool> SDKvideoOptions = {
                             "localVideoOn": true,
                           };
                           JoinSessionConfig joinSession = JoinSessionConfig(
                             sessionName:"71878749797",
                             //sessionPassword: "123",//await zoom.session.getSessionPassword(),//"KpmRyRft3osyOD3R1gKFElMEI4smjQ.1",
                             token: controller.sessionToken,
                             userName:"walid",// "displayName",
                             audioOptions: SDKaudioOptions,
                             videoOptions: SDKvideoOptions,
                             sessionIdleTimeoutMins: 20,
                           );
                           await zoom.joinSession(joinSession);*/

                         },
                         child:  SizedBox(
                           width: 280,
                           child: Text(controller.consultantsDetailsResponse.value.data?.meetingLink!=""?
                           controller.consultantsDetailsResponse.value.data!.meetingLink!:_local.not_found,
                             style: const TextStyle(fontSize: 14,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
                         ),
                       ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                whatsappClient();
              },
              child: Container(
                margin: const EdgeInsetsDirectional.only(bottom: 8),
                child: Text(_local.cancel_consultation,style: TextStyle(fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    color: AppColors.red)),
              ),
            ),
          ],
        ),
      ):Center(child: CircularProgressIndicator(color: AppColors.primary,))),
    );
  }
  void loading() {
    EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
  }


  whatsappClient()async{
    var phone2=controller.number.value;
    var iosUrl = "https://wa.me/$phone2";
    var  url='https://api.whatsapp.com/send?phone=$phone2';
    if(Platform.isIOS){
      await launchUrl(Uri.parse(iosUrl));
    }
    else{
      await launch(url);
    }
  }
  void showToast(String msg,
      {int? duration, int? gravity, BuildContext? context,bool isSuccess=true}) {
    //if (context != null) ToastMContext().init(context);

    print(isSuccess);
    BuildContext currentContext = navigatorKey.currentState!.context;
    ToastMContext().init(currentContext);
    var _local = getLocale();
    Toast.show(msg,isSuccess?_local.done:_local.incorrect,
        duration: duration, gravity: gravity??Toast.bottom,border: Border.all(color: AppColors.gray4,width: 1),isSuccess:isSuccess);
  }
  AppLocalizations getLocale() {
    BuildContext currentContext = navigatorKey.currentState!.context;

    var _local = AppLocalizations.of(currentContext)!;
    return _local;
  }

  Future<void> _openUrl(String url) async {
    print("ooo "+url);
    print("ooo2 "+Uri.parse(url).toString());
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
    dismissLoading();
  }
  void dismissLoading() async {
    await EasyLoading.dismiss();
  }

}