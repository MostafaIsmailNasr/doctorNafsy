import 'dart:io';

import 'package:eduGate_flutter/data/models/auth/ProfileResponse.dart';
import 'package:eduGate_flutter/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

import 'package:intl/intl.dart';

import '../../../app/base/base_controller/BaseController.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/util/util.dart';
import '../../../data/models/auth/register/RegisterRequest.dart';
import '../../../data/models/auth/register/UpdatePassRequest.dart';
import '../../../domain/usecases/auth_use_case.dart';
import '../../pages/auth/otp/otp_screen.dart';
import '../../pages/home/parent_main_screen.dart';
import '../../widgets/custom_toast/custom_toast.dart';
import '../home/home_binding.dart';
import '../home/home_controller.dart';

class RegisterController extends BaseController
    with GetSingleTickerProviderStateMixin {
  RegisterController(this._authUseCase);

  final AuthUseCase _authUseCase;
  final formKey = GlobalKey<FormState>();

  KeyboardVisibilityController _keyboardVisibilityController = KeyboardVisibilityController();



  RxInt selectedTabIndex = 0.obs;
  RxList governorateList = [].obs;
  RxList organizationList = [].obs;
  RxList educationLevelsList = [].obs;
  Rx<File?> imageCar = Rx<File?>(null);
  Rx<File?> imageLicense = Rx<File?>(null);
  Rx<File?> imageCerrificates = Rx<File?>(null);

  RegisterRequest registerRequest = RegisterRequest();

  UpdatePassRequest updatePassRequest = UpdatePassRequest();
  RxInt isOnline = 0.obs;
  RxString genderType = "male".obs;
  Rx<String> dropdownValue = "(+20)".obs;
  late TabController tabController;

  late TextEditingController currentPassController;
  late TextEditingController newPassController;
  late TextEditingController newPassConfirmController;

  late TextEditingController nameTextController;

  late TextEditingController phoneController;
  late TextEditingController EmailController;
  late TextEditingController passController;

  late TextEditingController passConfirmController;
  late TextEditingController governorateController;
  late TextEditingController organizationController;
  late TextEditingController educationLevelController;
  DateTime? selectedDateTime3;
  RxString strT = ''.obs;
  var dateTimeString;

  @override
  void onInit() async {
    super.onInit();
    print("init");
    
    _keyboardVisibilityController.onChange.listen((bool visible) {
      //setState(() {
        isKeyboardVisible.value = visible;
        print("isKeyboardVisible${isKeyboardVisible}");
      //});
      if (visible) {
        // Keyboard is open
        // Perform necessary actions when the keyboard is open
      } else {
        // Keyboard is closed
        // Perform necessary actions when the keyboard is closed
      }
    });
    currentPassController = TextEditingController();
    newPassController = TextEditingController();
    newPassConfirmController = TextEditingController();

    nameTextController = TextEditingController();
    phoneController = TextEditingController();
    EmailController = TextEditingController();
    passController = TextEditingController();
    passConfirmController = TextEditingController();
    governorateController = TextEditingController();
    organizationController = TextEditingController();
    educationLevelController = TextEditingController();
    //getGovernorate();
    if (isOnline.value == 0) {
      registerRequest.organId = "2";
      //getEducationLevels(2.toString());
    }

    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      print("--->${tabController.index}");
      selectedTabIndex.value = tabController.index;
    });
  }

  register(BuildContext context) async {
    try {
      loading();
      String androidId=await Utils.getDeviceInfo(context);
      registerRequest.fullName = nameTextController.text.toString();
      registerRequest.mobile = phoneController.text.toString();
      registerRequest.password = passController.text.toString();
      registerRequest.passwordConfirmation =
          passConfirmController.text.toString();
      registerRequest.countryCode =  "";//"+20";
      registerRequest.deviceId = androidId;
      //registerRequest.cityId = "77";
      //registerRequest.groupId = "2";
      // registerRequest.organId = "7";
      registerRequest.gender = genderType.value;
      registerRequest.type = "user";
      registerRequest.email = EmailController.text.toString();
      registerRequest.birthDate = strT.value;
      //   "":"77",
      // "":"2",
      // "":"7",
      // "":""
      final registerResponse = await _authUseCase.register(registerRequest);

      print("registerResponse");
      print(registerResponse.message);
      dismissLoading();
      switch (registerResponse.success) {
        case true:
          final status = registerResponse.status!;
          switch (status) {
            case /*AuthStatus.login.staus*/ "go_step_2":
              var userID = registerResponse.loginData?.userId.toString();
              Get.to(OtpScreen(NavigationFrom.register,
                  userID: userID, mobile: registerRequest.mobile,fullName:registerRequest.fullName));
              clearInputs();
              showToast(getLocale().your_account_has_been_created_successfully, gravity: Toast.bottom);
              break;
            case "go_step_3":
            //Get.to(HomePage());
              isLoggedIn.value = true;
              store.apiToken = registerResponse.loginData?.token;
              print("here"+registerResponse.loginData!.token!.toString());
              isLoggedIn.refresh();
              store.userID = registerResponse.loginData?.userId.toString();
              store.user?.deviceId=androidId;
              Get.offAll(ParentMainScreen(), binding: HomeBinding());
              break;
          }
          clearInputs();
          break;
        case false:
          showToast(registerResponse.message.toString(), gravity: Toast.bottom,isSuccess: false);
          break;
      }
    } catch (error) {
      //login(context);
      print("hhh "+error.toString());
      showToast(error.toString(), gravity: Toast.bottom);
      dismissLoading();
    }
  }

  /*register(BuildContext context) async {
    try {
      loading();
      String androidId=await Utils.getDeviceInfo(context);

      registerRequest.fullName = nameTextController.text.toString();
      registerRequest.mobile = phoneController.text.toString();
      registerRequest.password = passController.text.toString();
      registerRequest.passwordConfirmation =
          passConfirmController.text.toString();
      registerRequest.countryCode =  "0";//dropdownValue.value;
      registerRequest.deviceId = androidId;
      //registerRequest.cityId = "77";
      //registerRequest.groupId = "2";
      // registerRequest.organId = "7";
      registerRequest.gender = genderType.value;
      registerRequest.type = "user";
      registerRequest.email = EmailController.text.toString();
      registerRequest.birthDate = strT.value;
      //   "":"77",
      // "":"2",
      // "":"7",
      // "":""

      final registerResponse = await _authUseCase.register(registerRequest);

      print("registerResponse");
      print(registerResponse.message);
      dismissLoading();
      switch (registerResponse.success) {
        case true:
          final status = registerResponse.status!;
          switch (status) {
            case *//*AuthStatus.go_step_2.staus*//* "go_step_2":
              var userID = registerResponse.loginData?.userId.toString();
              Get.to(OtpScreen(NavigationFrom.register,
                  userID: userID, mobile: registerRequest.mobile,fullName:registerRequest.fullName));
              clearInputs();
              showToast(getLocale().your_account_has_been_created_successfully, gravity: Toast.bottom);
              break;
            case "go_step_3":
              //Get.to(HomePage());
              isLoggedIn.value = true;
              store.apiToken = registerResponse.loginData?.token;
              print("here"+registerResponse.loginData!.token!.toString());
              isLoggedIn.refresh();
              store.userID = registerResponse.loginData?.userId.toString();
              Get.offAll(ParentMainScreen(), binding: HomeBinding());
              break;
          }

          break;
        case false:
          showToast(registerResponse.message.toString(), gravity: Toast.bottom,isSuccess: false);
          break;
      }
    } catch (error) {
      print(error);
      register(context);
      //showToast(error.toString(), gravity: Toast.bottom);
      //dismissLoading();
    }
  }*/

  updateProfile(BuildContext context) async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }
      loading();
      String androidId=await Utils.getDeviceInfo(context);
      registerRequest.fullName = nameTextController.text.toString();
      registerRequest.mobile = phoneController.text.toString();
      registerRequest.password = passController.text.toString();
      registerRequest.passwordConfirmation =
          passConfirmController.text.toString();
      registerRequest.countryCode ="";//"20";
          //dropdownValue.value;
      registerRequest.deviceId =androidId;
      registerRequest.email = EmailController.text.toString();
      //registerRequest.cityId = "77";
      //registerRequest.groupId = "2";
      // registerRequest.organId = "7";
      registerRequest.gender = genderType.value;
      registerRequest.type = "user";
      registerRequest.birthDate = strT.value;
      print("registerRequest.organId" );
      print(registerRequest.organId );
      //   "":"77",
      // "":"2",
      // "":"7",
      // "":""

      final registerResponse =
      await _authUseCase.updateProfile(registerRequest);

      print("updateProfileResponse");
      print(registerResponse.message);
      dismissLoading();
      switch (registerResponse.success) {
        case true:
          showToast(registerResponse.message.toString(), gravity: Toast.bottom);
          Get.offAll(ParentMainScreen(), binding: HomeBinding());
          showToast(getLocale().profile_updated_successfully, gravity: Toast.bottom);

          break;
        case false:
          showToast(registerResponse.message.toString(), gravity: Toast.bottom,isSuccess: false);
          break;
      }
    } catch (error) {
      print("kkkkk"+error.toString());
      //updateProfile(context);
      //showToast(error.toString(), gravity: Toast.bottom);
      dismissLoading();
    }
  }

  updateProfilePass(BuildContext context) async {
    try {
      updatePassRequest.password = currentPassController.text.toString();
      updatePassRequest.passwordConfirmation =
          newPassConfirmController.text.toString();

      if (currentPassController.text.isEmpty) {
        showToast("Pass required", gravity: Toast.bottom,isSuccess: false);
        return;
      }
      if (newPassConfirmController.text.isEmpty) {
        showToast("new Pass required", gravity: Toast.bottom,isSuccess: false);
        return;
      }
      if (newPassController.text != newPassConfirmController.text) {
        showToast("Pass Not Match", gravity: Toast.bottom,isSuccess: false);
        return;
      }

      loading();
      final updatePassResponse =
      await _authUseCase.updateProfilePass(updatePassRequest);

      print("updatePassResponse");
      print(updatePassResponse.message);
      dismissLoading();
      switch (updatePassResponse.success) {
        case true:
          clearInputs();
          store.apiToken = updatePassResponse.tokenData?.token;
          // showToast(
          //     updatePassResponse.message.toString(), gravity: Toast.bottom);
          showToast(getLocale().profile_updated_successfully, gravity: Toast.bottom);

          Get.offAll(ParentMainScreen(), binding: HomeBinding());
          break;
        case false:
          showToast(
              updatePassResponse.message.toString(), gravity: Toast.bottom,isSuccess: false);
          break;
      }
    } catch (error) {
      print(error);
      updateProfilePass(context);
      //showToast(error.toString(), gravity: Toast.bottom);
      dismissLoading();
    }
  }



  updateProfileImage(File userImage) async {
    try {
      loading();
      final updateImageResponse =
      await _authUseCase.updateProfileImage(userImage);

      print("updateImageResponse");
      print(updateImageResponse.message);
      dismissLoading();
      switch (updateImageResponse.success) {
        case true:
          clearInputs();
          // showToast(
          //     updateImageResponse.message.toString(), gravity: Toast.bottom);
          showToast(getLocale().profile_updated_successfully, gravity: Toast.bottom);
          Get.offAll(ParentMainScreen(), binding: HomeBinding());
          break;
        case false:
          showToast(
              updateImageResponse.message.toString(), gravity: Toast.bottom,isSuccess: false);
          break;
      }
    } catch (error) {
      print(error);
      updateProfileImage(userImage);
      //showToast(error.toString(), gravity: Toast.bottom);
      dismissLoading();
    }
  }

  pickImage(BuildContext context) async{
    var pickedImage =
        await Utils.getImage(context, ImgSource.Both);
    if (pickedImage != null){
    var imagePath = pickedImage.path;
    print("imagePath====>");
    print(imagePath);
    updateProfileImage(File(imagePath));
    }

  }

  getGovernorate() async {
    try {
      final governorateResponse = await _authUseCase.getGovernorate();

      print("governorateResponse");
      print(governorateResponse.message);

      switch (governorateResponse.success) {
        case true:
          governorateList.value =
          governorateResponse.governorateData!.cities as List;
          break;
        case false:
          break;
      }
    } catch (error) {
      print(error);
      getGovernorate();
      //showToast(error.toString(), gravity: Toast.bottom);
      dismissLoading();
    }
  }

  getOrganizations(String cityId) async {
    try {
      organizationList.value = [];
      final organizationResponse = await _authUseCase.getOrganizations(cityId);

      print("organizationResponse");
      print(organizationResponse.message);

      switch (organizationResponse.success) {
        case true:
          organizationList.value =
          organizationResponse.organizationData!.organizations as List;
          break;
        case false:
          break;
      }
    } catch (error) {
      print(error);
      getOrganizations(cityId);
      //showToast(error.toString(), gravity: Toast.bottom);
      dismissLoading();
    }
  }

  getEducationLevels(String organID) async {
    try {
      educationLevelsList.value = [];
      final educationLevelResponse =
      await _authUseCase.getEducationLevels(organID);

      print("governorateResponse");
      print(educationLevelResponse.message);

      switch (educationLevelResponse.success) {
        case true:
          educationLevelsList.value =
          educationLevelResponse.groupsData!.groups as List;
          break;
        case false:
          break;
      }
    } catch (error) {
      print(error);
      getEducationLevels(organID);
      //showToast(error.toString(), gravity: Toast.bottom);
      dismissLoading();
    }
  }

  void clearInputs() {
    nameTextController.clear();
    phoneController.clear();
    passController.clear();
    passConfirmController.clear();
    governorateController.clear();
    educationLevelController.clear();
    organizationController.clear();
    currentPassController.clear();
    newPassController.clear();
    newPassConfirmController.clear();
    EmailController.clear();
    isOnline.value = 0;
    genderType.value="male";
  }

  void bindData() {
    nameTextController.text = store.user?.fullName ?? "";
    EmailController.text=store.user?.email ?? "";
    phoneController.text = store.user?.mobile ?? "";
    educationLevelController.text = store.user?.userGroup?.name ?? "";
    organizationController.text = store.user?.organization?.organName ?? "";
    if(strT.value==""){
      strT.value=store!.user!.birthDate!;
      //governorateController.text =store.user?.birthDate ?? "";
    }else{
      strT.value=strT.value;
      //governorateController.text=strT.value ?? "";
    }

    genderType.value=store.user?.gender;

    registerRequest.groupId = (store.user?.userGroup?.id ?? "").toString();
    registerRequest.organId =
        (store.user?.organization?.organId ?? "").toString();
    registerRequest.cityId = (store.user?.cityId ?? "").toString();
    print("store.user?.organization?.organId" );
    print(store.user?.organization?.organId );
    if (((store.user?.organization?.organId ?? "").toString()
        .isEmpty||(store.user?.organization?.organId ?? "").toString()=="2")
        ) {
      isOnline.value = 0;
    }else{
      isOnline.value = 1;
    }
    update();
  }



  logoutRequest() async {
    try {

      final logoutResponse =
      await _authUseCase.logoutRequest();

      print("logoutResponse");
      print(logoutResponse.message);
      switch (logoutResponse.success) {
        case true:

          break;
        case false:

          break;
      }
    } catch (error) {
      print(error);
      logoutRequest();
      //showToast(error.toString(), gravity: Toast.bottom);
    }
  }

  deleteAccount(BuildContext context) async {
    try {

      final deleteAccountResponse =
      await _authUseCase.deleteAccount();

      print("deleteAccountResponse");
      print(deleteAccountResponse.message);
      switch (deleteAccountResponse.success) {
        case true:
          showToast(
              deleteAccountResponse.message.toString(), gravity: Toast.bottom,isSuccess: true);
          logout(context);
          break;
        case false:
          showToast(
              deleteAccountResponse.message.toString(), gravity: Toast.bottom,isSuccess: false);
          break;
      }
    } catch (error) {
      print(error);
      deleteAccount(context);
      //showToast(error.toString(), gravity: Toast.bottom);
    }
  }

  Future<void> PickStartTime2(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime3 ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return  Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: AppColors.MainColor, // <-- SEE HERE
                    onPrimary: Colors.white, // <-- SEE HERE
                    onSurface: AppColors.MainColor, // <-- SEE HERE
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      primary: Colors.red, // button text color
                    ),
                  ),
                ),
                child: child!,
              );
            }
        );
      },
    );
    if (pickedDate != null) {
      selectedDateTime3 = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final dateFormat = DateFormat('yyyy-MM-dd');
      final formattedDate = dateFormat.format(selectedDateTime3!);
      dateTimeString = '$formattedDate';
      strT.value = dateTimeString;

      print(dateTimeString);
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    passController.dispose();
    nameTextController.dispose();
    EmailController.dispose();
    phoneController.dispose();
    passController.dispose();
    passConfirmController.dispose();
    organizationController.dispose();
    clearInputs();
     // _keyboardVisibilityController.dispose();

    super.dispose();
  }



}
