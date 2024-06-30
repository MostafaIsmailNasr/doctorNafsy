import 'package:get/get.dart';

import '../../../app/base/base_controller/BaseController.dart';
import '../../../app/services/local_storage.dart';
import '../../../data/models/ConsultantsDetailsModel/ConsultantsDetailsResponse.dart';
import '../../../data/providers/web_servies/WebServies.dart';
import '../../../data/repositories/Redmee_points_repository.dart';
import '../../../domain/repositories/support_repository.dart';
import '../../../domain/usecases/support_use_case.dart';
import '../../widgets/custom_toast/custom_toast.dart';

class ConsultingDetailsController extends BaseController {
  PointsRepository repo = PointsRepository(WebService());
  var consultantsDetailsResponse = ConsultantsDetailsResponse().obs;
  RxList supportList = [].obs;
  RxString number="".obs;
  var isLoading = false.obs;
  var sessionToken="";

  getConsultantsList(int id)async{
    final storage = Get.find<LocalStorageService>();
    isLoading.value=true;
    consultantsDetailsResponse.value = await repo.getConsultantsDetails(id);
    if(consultantsDetailsResponse.value.success==true){
      isLoading.value=false;
      getSupportContacts();
    }
    return consultantsDetailsResponse.value;
  }

  getSupportContacts() async {
    supportList.value = [];
    try {
      RxStatus.loading();
      isLoading.value = true;
      final _supportContactResponse = await repo.getSupportContact();
      isLoading.value = false;
      print("_supportContactResponse");
      print(_supportContactResponse.toJson());
      switch ((_supportContactResponse).success) {
        case true:
          supportList.value = _supportContactResponse.supportdata as List;
          number.value=_supportContactResponse.supportdata![0].number??"";
          break;
        case false:
          dismissLoading();
          showToast(_supportContactResponse.message.toString(),
              gravity: Toast.bottom,isSuccess: false);
          break;
      }
    } catch (error) {
      print(error);
      //getSupportContacts();
      // showToast(error.toString(), gravity: Toast.bottom);
    }
  }
}