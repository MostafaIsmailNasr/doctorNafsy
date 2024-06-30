class RegisterRequest {
  RegisterRequest({
      this.type, 
      this.fullName,
      this.email,
      this.mobile, 
      this.countryCode, 
      this.password, 
      this.passwordConfirmation, 
      this.deviceId, 
      this.cityId, 
      this.groupId, 
      this.organId, 
      this.gender,this.birthDate});

  RegisterRequest.fromJson(dynamic json) {
    type = json['type'];
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    deviceId = json['device_id'];
    cityId = json['city_id'];
    groupId = json['group_id'];
    organId = json['organ_id'];
    gender = json['gender'];
    birthDate = json['birth_date'];
  }
  String? type;
  String? fullName;
  String? email;
  String? mobile;
  String? countryCode;
  String? password;
  String? passwordConfirmation;
  String? deviceId;
  String? cityId;
  String? groupId;
  String? organId;
  String? gender;
  String? birthDate;

  Map<String, dynamic> toJson(bool isRegister) {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['full_name'] = fullName;
    map['email'] = email;
    map['mobile'] = mobile;
    map['country_code'] = countryCode;
    if (isRegister){
      map['password'] = password;
    map['password_confirmation'] = passwordConfirmation;
  }
    map['device_id'] = deviceId;
    map['city_id'] = cityId;
    map['group_id'] = groupId;
    map['organ_id'] = organId;
    map['gender'] = gender;
    map['birth_date'] = birthDate;
    return map;
  }

}