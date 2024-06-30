import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/base/base_controller/BaseController.dart';
import '../../../app/services/local_storage.dart';
import '../../../data/models/consultationsoModel/ConsultantsResponse.dart';
import '../../../data/providers/web_servies/WebServies.dart';
import '../../../data/repositories/Redmee_points_repository.dart';

class ConsultingController extends BaseController {
  PointsRepository repo = PointsRepository(WebService());
  var consultantsResponse = ConsultantsResponse().obs;
  RxList<dynamic> consultantsList=[].obs;
  var isLoading = false.obs;

  getConsultantsList(String type)async{
    final storage = Get.find<LocalStorageService>();
    isLoading.value=true;
    consultantsResponse.value = await repo.getConsultantsList(type);
    consultantsList.value=consultantsResponse.value.data??[];
    isLoading.value=false;
    return consultantsResponse.value;
  }

}