import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/base/base_controller/BaseController.dart';
import '../../../data/models/PickupDateModel/HoursModel/HoursResponse.dart';
import '../../../data/models/PickupDateModel/PickupDateResponse.dart';
import '../../../data/providers/web_servies/WebServies.dart';
import '../../../data/repositories/Redmee_points_repository.dart';
import '../../widgets/custom_toast/custom_toast.dart';

class BookConsultationController extends BaseController {
  PointsRepository repo = PointsRepository(WebService());
  var pickupDateResponse = PickupDateResponse().obs;
  var hoursResponse = HoursResponse().obs;
  RxList<dynamic> pickUpDateList = [].obs;
  RxList<dynamic> pickUpHoursList = [].obs;
  var PickDate;
  var PickDateHours;
  var finalPickupTime="".obs;
  var isLoading2 = false.obs;

  getPickUpDates(int id)async{
    isLoading.value=true;
    pickupDateResponse.value = await repo.getPickupDate(id);
    if(pickupDateResponse.value.success==true){
      isLoading.value=false;
      pickUpDateList.value=pickupDateResponse.value.data as List;
      PickDate=pickupDateResponse.value.data![0].date!;
      getPickUpHoursDates2(pickupDateResponse.value.data![0].date!,id);
    }
    return pickupDateResponse.value;
  }

  getPickUpHoursDates(int id)async{
    isLoading2.value=true;
    hoursResponse.value = await repo.getHours(PickDate,id);
    if(hoursResponse.value.success==true){
      isLoading2.value=false;
      pickUpHoursList.value=hoursResponse.value.data as List;

    }else{
      isLoading2.value=false;
      showToast(hoursResponse.value.message.toString(),
          gravity: Toast.top,isSuccess: false);
    }
    return hoursResponse.value;
  }

  getPickUpHoursDates2(String PickDate2,int id)async{
    isLoading2.value=true;
    hoursResponse.value = await repo.getHours(PickDate2,id);
    if(hoursResponse.value.success==true){
      isLoading2.value=false;
      pickUpHoursList.value=hoursResponse.value.data as List;
    }else{
      isLoading2.value=false;
      showToast(hoursResponse.value.message.toString(),
          gravity: Toast.top,isSuccess: false);
    }
    return hoursResponse.value;
  }
}