import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart' as dio1;

import '../../../app/services/local_storage.dart';
import '../../models/BaseResponse.dart';
import '../../models/ConsultantsDetailsModel/ConsultantsDetailsResponse.dart';
import '../../models/CreateConsultatModel/CreateConsultatResponse.dart';
import '../../models/PickupDateModel/HoursModel/HoursResponse.dart';
import '../../models/PickupDateModel/PickupDateResponse.dart';
import '../../models/consultationsoModel/ConsultantsResponse.dart';
import '../../models/couponModel/CouponResponse.dart';
import '../../models/home/newHomeModel/HomeListResponse.dart';
import '../../models/listPointsModle/ListPointsResponse.dart';
import '../../models/search/SearchListModel/SearchListResponse.dart';
import '../../models/support/SupportContactResponse.dart';
import '../../models/teachers/teacherListModel/TeacherListResponse.dart';
import '../../models/validateConsultatCouponeModel/validateConsultatCouponeResponse.dart';

class WebService {
  late dio1.Dio dio;
  late dio1.BaseOptions options;
  final storage = Get.find<LocalStorageService>();
  //var baseUrl = "http://edugatem.com";
 var baseUrl = "https://dr-nafsy.com";
  final store = Get.find<LocalStorageService>();

  WebService() {
    options = dio1.BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 60 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    );
    dio = dio1.Dio(options);
  }

  Future<ListPointsResponse> listPoints(String token)async{
    try {
      var Url="/api/development/redeem_points";
      //print(Url);
        print(options.baseUrl+Url);
        print(token.toString());
        dio1.Response response = await dio.get(Url,
            options: dio1.Options(
              headers: {
                'x-api-key': '1234321',
                "X-Locale": storage.lang ?? "ar",
                "authorization": "Bearer ${token}",
              },
            )
        );
        print(response);
        return ListPointsResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return ListPointsResponse();
    }
  }

  Future<CouponResponse> createCoupon(String token,int id)async{
    try {
      var Url="/api/development/redeem_points/$id";
      //print(Url);
      print(options.baseUrl+Url);
      print(token.toString());
      dio1.Response response = await dio.post(Url,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              "authorization": "Bearer ${token}",
            },
          )
      );
      print(response);
      return CouponResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return CouponResponse();
    }
  }

  Future<HomeListResponse> getHomeNewList()async{
    try {
      var Url="/api/development/home";
      //print(Url);
      print(options.baseUrl+Url);
      //print(token.toString());
      dio1.Response response = await dio.get(Url,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              //"authorization": "Bearer ${token}",
            },
          )
      );
      print(response);
      return HomeListResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return HomeListResponse();
    }
  }

  Future<TeacherListResponse> getTeacherList(String teacherType)async{
    try {
      var Url="/api/development/teachers";
      //print(Url);
      var param={
        'teacher_type':teacherType
      };
      print(options.baseUrl+Url+param.toString());
      //print(token.toString());
      dio1.Response response = await dio.get(Url,queryParameters: param,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              //"authorization": "Bearer ${token}",
            },
          )
      );
      print(response);
      return TeacherListResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return TeacherListResponse();
    }
  }

  Future<SearchListResponse> getSearchList(String type,String word)async{
    final storage = Get.find<LocalStorageService>();
    try {
      var Url="/api/development/search?";
      //print(Url);
      var param={
        "search": word,
        'type':type
      };
      print(options.baseUrl+Url+param.toString());
      //print(token.toString());
      dio1.Response response = await dio.get(Url,queryParameters: param,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              "authorization": "Bearer ${storage.apiToken}",
            },
          )
      );
      print(response);
      return SearchListResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return SearchListResponse();
    }
  }

  Future<ConsultantsResponse> getConsultantsList(String type)async{
    final storage = Get.find<LocalStorageService>();
    try {
      var Url="/api/development/consultants?";
      //print(Url);
      var param={
        'type':type,
        'user_id': store.userID
      };
      print(options.baseUrl+Url+param.toString());
      //print(token.toString());
      dio1.Response response = await dio.get(Url,queryParameters: param,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              //"authorization": "Bearer ${storage.apiToken}",
            },
          )
      );
      print(response);
      return ConsultantsResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return ConsultantsResponse();
    }
  }

  Future<ConsultantsDetailsResponse> getConsultantsDetails(int id)async{
    final storage = Get.find<LocalStorageService>();
    try {
      var Url="/api/development/consultants/$id";
      print(options.baseUrl+Url);
      dio1.Response response = await dio.get(Url,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              //"authorization": "Bearer ${storage.apiToken}",
            },
          )
      );
      print(response);
      return ConsultantsDetailsResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return ConsultantsDetailsResponse();
    }
  }


  Future<SupportContactResponse> getSupportContact()async{
    final storage = Get.find<LocalStorageService>();
    try {
      var Url="/api/development/contacts/support";
      print(options.baseUrl+Url);
      dio1.Response response = await dio.get(Url,
          options: dio1.Options(
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              'x-api-key': '1234321',
              "User-Agent": "PostmanRuntime/7.31.3",
              "Accept": "*/*",
              "X-Locale": storage.lang ?? "ar",
              "Connection": "keep-alive",
              "Authorization":
              "Bearer " + (storage.apiToken == null ? "" : storage.apiToken!)
            },
          )
      );
      print(response);
      return SupportContactResponse.fromJson(response.data);

    }catch(e){
      print(e.toString());
      return SupportContactResponse();
    }
  }

  Future<PickupDateResponse> getPickupDate(int teacherId)async{
    try {
      var Url="/api/development/working_hours/availability_dates";
      //print(Url);
      var param={
        'teacher_id':teacherId,
      };
      print(options.baseUrl+Url+param.toString());
      dio1.Response response = await dio.get(Url,queryParameters: param,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
            },
          )
      );
      print(response);
      return PickupDateResponse.fromJson(response.data);
    }catch(e){
      print(e.toString());
      return PickupDateResponse();
    }
  }

  Future<HoursResponse> getHours(String date,int teacherId)async{
    try {
      var Url="/api/development/working_hours/available_times";
      print(Url);
      var params={
        'date': date,
        'teacher_id': teacherId,
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,queryParameters: params,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
            },
          )
      );
      print(response);
      return HoursResponse.fromJson(response.data);
    }catch(e){
      print(e.toString());
      return HoursResponse();
    }
  }

  Future<validateConsultatCouponeResponse> validateConsultantCoupon(String code)async{
    try {
      var Url="/api/development/consultants/valideCoupon";
      print(Url);
      var params={
        'coupon': code,
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.post(Url,data: params,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              "authorization": "Bearer ${storage.apiToken}"
            },
          )
      );
      print(response);
      return validateConsultatCouponeResponse.fromJson(response.data);
    }catch(e){
      print(e.toString());
      return validateConsultatCouponeResponse();
    }
  }

  Future<CreateConsultatResponse> createConsultantOrder(int sessionDuration,
      String startDate,
      int doctorId,
      double discount,
      double totalPrice,String discountId)async{
    try {
      var Url="/api/development/consultants/store";
      print(Url);
      var params={
        'session_duration': sessionDuration.toString(),
        'start_date': startDate,
        'doctor_id': doctorId,
        'discount': discount,
        'total_price': totalPrice,
        'discount_id': discountId
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.post(Url,data: params,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              "authorization": "Bearer ${storage.apiToken}"
            },
          )
      );
      print(response);
      return CreateConsultatResponse.fromJson(response.data);
    }catch(e){
      print(e.toString());
      return CreateConsultatResponse();
    }
  }

  Future<dynamic> addCommentWithImageAndVoice(String? itemID, String? itemName, String? courseId,
      String? commentImag, String? commentSound, String? comment)async{
    try {
      var Url="/api/development/panel/comments";
      print(Url);
      var formData =
      dio1.FormData.fromMap({
        'item_id': itemID,
        'item_name': itemName,
        'comment':comment,
      });
      if(commentImag!=null&&commentSound==null) {
        // //[4] ADD IMAGE TO UPLOAD
        var Imagefile = File(commentImag.toString());
        var file = await dio1.MultipartFile.fromFile(Imagefile.path,
            filename: basename(Imagefile.path));
            //contentType: MediaType("image", "title.png"));
        formData.files.add(MapEntry('image', file));
      }else if(commentImag==null&&commentSound!=null) {
        // //[4] ADD IMAGE TO UPLOAD
        var soundfile = File(commentSound.toString());
        var file = await dio1.MultipartFile.fromFile(soundfile.path,
            filename: basename(soundfile.path));
        //contentType: MediaType("image", "title.png"));
        formData.files.add(MapEntry('voice', file));
      }else if(commentImag!=null&&commentSound!=null) {
        // //[4] ADD IMAGE TO UPLOAD
        var soundfile = File(commentSound.toString());
        var file1 = await dio1.MultipartFile.fromFile(soundfile.path,
            filename: basename(soundfile.path));
        //contentType: MediaType("image", "title.png"));
        formData.files.add(MapEntry('voice', file1));
        //
        var Imagefile = File(commentImag.toString());
        var file2 = await dio1.MultipartFile.fromFile(Imagefile.path,
            filename: basename(Imagefile.path));
        //contentType: MediaType("image", "title.png"));
        formData.files.add(MapEntry('image', file2));
      }

      // if(commentSound!=null) {
      //   // //[4] ADD IMAGE TO UPLOAD
      //   var soundfile = File(commentSound.toString());
      //   var file = await dio1.MultipartFile.fromFile(soundfile.path,
      //       filename: basename(soundfile.path));
      //   //contentType: MediaType("image", "title.png"));
      //   formData.files.add(MapEntry('voice', file));
      // }
      print(options.baseUrl+Url+formData.files.toString());
      print(options.baseUrl+Url+formData.fields.toString());
      dio1.Response response = await dio.post(Url,data: formData,
          options: dio1.Options(
            headers: {
              'x-api-key': '1234321',
              "X-Locale": storage.lang ?? "ar",
              "authorization": "Bearer ${storage.apiToken}"
            },
          ));
      print(response);
      if(response.statusCode==200){
        print("klkl"+BaseResponse.fromJson(response.data).toString());
        return BaseResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return BaseResponse();
      }
    }catch(e){
      print(e.toString());
      return BaseResponse();
    }
  }

}