import 'dart:io';

import '../models/ConsultantsDetailsModel/ConsultantsDetailsResponse.dart';
import '../models/CreateConsultatModel/CreateConsultatResponse.dart';
import '../models/PickupDateModel/HoursModel/HoursResponse.dart';
import '../models/PickupDateModel/PickupDateResponse.dart';
import '../models/consultationsoModel/ConsultantsResponse.dart';
import '../models/couponModel/CouponResponse.dart';
import '../models/home/newHomeModel/HomeListResponse.dart';
import '../models/listPointsModle/ListPointsResponse.dart';
import '../models/search/SearchListModel/SearchListResponse.dart';
import '../models/support/SupportContactResponse.dart';
import '../models/teachers/teacherListModel/TeacherListResponse.dart';
import '../models/validateConsultatCouponeModel/validateConsultatCouponeResponse.dart';
import '../providers/web_servies/WebServies.dart';

class PointsRepository {
  WebService webService;
  PointsRepository(this.webService);

  Future<ListPointsResponse> listPoints(String token)async{
    final points=await webService.listPoints(token);
    return points;
  }

  Future<CouponResponse> createCoupon(String token,int id)async{
    final coupon=await webService.createCoupon(token,id);
    return coupon;
  }

  Future<HomeListResponse> getHomeNewList()async{
    final home=await webService.getHomeNewList();
    return home;
  }

  Future<TeacherListResponse> getTeacherList(String teacherType)async{
    final doctor=await webService.getTeacherList(teacherType);
    return doctor;
  }

  Future<SearchListResponse> getSearchList(String type,String word)async{
    final search=await webService.getSearchList(type,word);
    return search;
  }

  Future<ConsultantsResponse> getConsultantsList(String type)async{
    final consultantsList=await webService.getConsultantsList(type);
    return consultantsList;
  }

  Future<ConsultantsDetailsResponse> getConsultantsDetails(int id)async{
    final consultantsDetails=await webService.getConsultantsDetails(id);
    return consultantsDetails;
  }

  Future<SupportContactResponse> getSupportContact()async{
    final support=await webService.getSupportContact();
    return support;
  }

  Future<PickupDateResponse> getPickupDate(int teacherId)async{
    final dataTime=await webService.getPickupDate(teacherId);
    return dataTime;
  }

  Future<HoursResponse> getHours(String date,int teacherId)async{
    final time=await webService.getHours(date,teacherId);
    return time;
  }

  Future<validateConsultatCouponeResponse> validateConsultantCoupon(String code)async{
    final validateConsultatCoupone=await webService.validateConsultantCoupon(code);
    return validateConsultatCoupone;
  }

  Future<CreateConsultatResponse> createConsultantOrder(int sessionDuration,
      String startDate,
      int doctorId,
      double discount,
      double totalPrice,String discountId)async{
    final createConsultant=await webService.createConsultantOrder(sessionDuration,startDate,doctorId,discount,totalPrice,discountId);
    return createConsultant;
  }

  Future<dynamic> addCommentWithImageAndVoice(String? itemID, String? itemName, String? courseId,
      String? commentImag, String? commentSound, String? comment)async{
    final addCommentWithImage=await webService.addCommentWithImageAndVoice(itemID, itemName, courseId, commentImag, commentSound, comment);
    return addCommentWithImage;
  }
}