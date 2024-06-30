class HomeListResponse {
  bool? success;
  String? status;
  String? message;
  Data? data;

  HomeListResponse({this.success, this.status, this.message, this.data});

  HomeListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != dynamic ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Doctors>? doctors;
  List<Coachs>? coachs;
  List<Therapists>? therapists;

  Data({this.doctors, this.coachs, this.therapists});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
    if (json['coachs'] != null) {
      coachs = <Coachs>[];
      json['coachs'].forEach((v) {
        coachs!.add(new Coachs.fromJson(v));
      });
    }
    if (json['therapists'] != null) {
      therapists = <Therapists>[];
      json['therapists'].forEach((v) {
        therapists!.add(new Therapists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    if (this.coachs != null) {
      data['coachs'] = this.coachs!.map((v) => v.toJson()).toList();
    }
    if (this.therapists != null) {
      data['therapists'] = this.therapists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? id;
  String? fullName;
  String? roleName;
  String? teacherType;
  int? price30;
  int? price45;
  dynamic? organId;
  dynamic? deviceId;
  dynamic? mobile;
  String? email;
  String? balance;
  dynamic? facebook;
  dynamic? parentMobile;
  dynamic? bio;
  int? isFeature;
  dynamic? orderBy;
  dynamic? androidToken;
  dynamic? iosToken;
  int? verified;
  int? financialApproval;
  dynamic? avatar;
  String? gender;
  dynamic? birthDate;
  dynamic? coverImg;
  dynamic? headline;
  dynamic? about;
  dynamic? address;
  dynamic? countryId;
  dynamic? provinceId;
  dynamic? cityId;
  dynamic? districtId;
  dynamic? location;
  dynamic? levelOfTraining;
  String? meetingType;
  String? status;
  dynamic? language;
  dynamic? timezone;
  int? newsletter;
  int? publicMessage;
  dynamic? accountType;
  dynamic? iban;
  dynamic? accountId;
  dynamic? identityScan;
  dynamic? certificate;
  dynamic? commission;
  int? affiliate;
  int? ban;
  dynamic? banStartAt;
  dynamic? banEndAt;
  int? offline;
  dynamic? offlineMessage;
  int? createdAt;
  dynamic? updatedAt;
  dynamic? deletedAt;
  String? rate;

  Doctors(
      {this.id,
        this.fullName,
        this.roleName,
        this.teacherType,
        this.price30,
        this.price45,
        this.organId,
        this.deviceId,
        this.mobile,
        this.email,
        this.balance,
        this.facebook,
        this.parentMobile,
        this.bio,
        this.isFeature,
        this.orderBy,
        this.androidToken,
        this.iosToken,
        this.verified,
        this.financialApproval,
        this.avatar,
        this.gender,
        this.birthDate,
        this.coverImg,
        this.headline,
        this.about,
        this.address,
        this.countryId,
        this.provinceId,
        this.cityId,
        this.districtId,
        this.location,
        this.levelOfTraining,
        this.meetingType,
        this.status,
        this.language,
        this.timezone,
        this.newsletter,
        this.publicMessage,
        this.accountType,
        this.iban,
        this.accountId,
        this.identityScan,
        this.certificate,
        this.commission,
        this.affiliate,
        this.ban,
        this.banStartAt,
        this.banEndAt,
        this.offline,
        this.offlineMessage,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.rate});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    teacherType = json['teacher_type'];
    price30 = json['price_30'];
    price45 = json['price_45'];
    organId = json['organ_id'];
    deviceId = json['device_id'];
    mobile = json['mobile'];
    email = json['email'];
    balance = json['balance'];
    facebook = json['facebook'];
    parentMobile = json['parent_mobile'];
    bio = json['bio'];
    isFeature = json['is_feature'];
    orderBy = json['order_by'];
    androidToken = json['android_token'];
    iosToken = json['ios_token'];
    verified = json['verified'];
    financialApproval = json['financial_approval'];
    avatar = json['avatar'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    coverImg = json['cover_img'];
    headline = json['headline'];
    about = json['about'];
    address = json['address'];
    countryId = json['country_id'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    location = json['location'];
    levelOfTraining = json['level_of_training'];
    meetingType = json['meeting_type'];
    status = json['status'];
    language = json['language'];
    timezone = json['timezone'];
    newsletter = json['newsletter'];
    publicMessage = json['public_message'];
    accountType = json['account_type'];
    iban = json['iban'];
    accountId = json['account_id'];
    identityScan = json['identity_scan'];
    certificate = json['certificate'];
    commission = json['commission'];
    affiliate = json['affiliate'];
    ban = json['ban'];
    banStartAt = json['ban_start_at'];
    banEndAt = json['ban_end_at'];
    offline = json['offline'];
    offlineMessage = json['offline_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['teacher_type'] = this.teacherType;
    data['price_30'] = this.price30;
    data['price_45'] = this.price45;
    data['organ_id'] = this.organId;
    data['device_id'] = this.deviceId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['balance'] = this.balance;
    data['facebook'] = this.facebook;
    data['parent_mobile'] = this.parentMobile;
    data['bio'] = this.bio;
    data['is_feature'] = this.isFeature;
    data['order_by'] = this.orderBy;
    data['android_token'] = this.androidToken;
    data['ios_token'] = this.iosToken;
    data['verified'] = this.verified;
    data['financial_approval'] = this.financialApproval;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['cover_img'] = this.coverImg;
    data['headline'] = this.headline;
    data['about'] = this.about;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['location'] = this.location;
    data['level_of_training'] = this.levelOfTraining;
    data['meeting_type'] = this.meetingType;
    data['status'] = this.status;
    data['language'] = this.language;
    data['timezone'] = this.timezone;
    data['newsletter'] = this.newsletter;
    data['public_message'] = this.publicMessage;
    data['account_type'] = this.accountType;
    data['iban'] = this.iban;
    data['account_id'] = this.accountId;
    data['identity_scan'] = this.identityScan;
    data['certificate'] = this.certificate;
    data['commission'] = this.commission;
    data['affiliate'] = this.affiliate;
    data['ban'] = this.ban;
    data['ban_start_at'] = this.banStartAt;
    data['ban_end_at'] = this.banEndAt;
    data['offline'] = this.offline;
    data['offline_message'] = this.offlineMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['rate'] = this.rate;
    return data;
  }
}

class Coachs {
  int? id;
  String? fullName;
  String? roleName;
  String? teacherType;
  dynamic? price30;
  dynamic? price45;
  dynamic? organId;
  dynamic? deviceId;
  dynamic? mobile;
  String? email;
  String? balance;
  dynamic? facebook;
  dynamic? parentMobile;
  dynamic? bio;
  int? isFeature;
  dynamic? orderBy;
  dynamic? androidToken;
  dynamic? iosToken;
  int? verified;
  int? financialApproval;
  dynamic? avatar;
  String? gender;
  dynamic? birthDate;
  dynamic? coverImg;
  dynamic? headline;
  dynamic? about;
  dynamic? address;
  dynamic? countryId;
  dynamic? provinceId;
  dynamic? cityId;
  dynamic? districtId;
  dynamic? location;
  dynamic? levelOfTraining;
  String? meetingType;
  String? status;
  dynamic? language;
  dynamic? timezone;
  int? newsletter;
  int? publicMessage;
  dynamic? accountType;
  dynamic? iban;
  dynamic? accountId;
  dynamic? identityScan;
  dynamic? certificate;
  dynamic? commission;
  int? affiliate;
  int? ban;
  dynamic? banStartAt;
  dynamic? banEndAt;
  int? offline;
  dynamic? offlineMessage;
  int? createdAt;
  dynamic? updatedAt;
  dynamic? deletedAt;
  String? rate;

  Coachs(
      {this.id,
        this.fullName,
        this.roleName,
        this.teacherType,
        this.price30,
        this.price45,
        this.organId,
        this.deviceId,
        this.mobile,
        this.email,
        this.balance,
        this.facebook,
        this.parentMobile,
        this.bio,
        this.isFeature,
        this.orderBy,
        this.androidToken,
        this.iosToken,
        this.verified,
        this.financialApproval,
        this.avatar,
        this.gender,
        this.birthDate,
        this.coverImg,
        this.headline,
        this.about,
        this.address,
        this.countryId,
        this.provinceId,
        this.cityId,
        this.districtId,
        this.location,
        this.levelOfTraining,
        this.meetingType,
        this.status,
        this.language,
        this.timezone,
        this.newsletter,
        this.publicMessage,
        this.accountType,
        this.iban,
        this.accountId,
        this.identityScan,
        this.certificate,
        this.commission,
        this.affiliate,
        this.ban,
        this.banStartAt,
        this.banEndAt,
        this.offline,
        this.offlineMessage,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.rate});

  Coachs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    teacherType = json['teacher_type'];
    price30 = json['price_30'];
    price45 = json['price_45'];
    organId = json['organ_id'];
    deviceId = json['device_id'];
    mobile = json['mobile'];
    email = json['email'];
    balance = json['balance'];
    facebook = json['facebook'];
    parentMobile = json['parent_mobile'];
    bio = json['bio'];
    isFeature = json['is_feature'];
    orderBy = json['order_by'];
    androidToken = json['android_token'];
    iosToken = json['ios_token'];
    verified = json['verified'];
    financialApproval = json['financial_approval'];
    avatar = json['avatar'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    coverImg = json['cover_img'];
    headline = json['headline'];
    about = json['about'];
    address = json['address'];
    countryId = json['country_id'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    location = json['location'];
    levelOfTraining = json['level_of_training'];
    meetingType = json['meeting_type'];
    status = json['status'];
    language = json['language'];
    timezone = json['timezone'];
    newsletter = json['newsletter'];
    publicMessage = json['public_message'];
    accountType = json['account_type'];
    iban = json['iban'];
    accountId = json['account_id'];
    identityScan = json['identity_scan'];
    certificate = json['certificate'];
    commission = json['commission'];
    affiliate = json['affiliate'];
    ban = json['ban'];
    banStartAt = json['ban_start_at'];
    banEndAt = json['ban_end_at'];
    offline = json['offline'];
    offlineMessage = json['offline_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['teacher_type'] = this.teacherType;
    data['price_30'] = this.price30;
    data['price_45'] = this.price45;
    data['organ_id'] = this.organId;
    data['device_id'] = this.deviceId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['balance'] = this.balance;
    data['facebook'] = this.facebook;
    data['parent_mobile'] = this.parentMobile;
    data['bio'] = this.bio;
    data['is_feature'] = this.isFeature;
    data['order_by'] = this.orderBy;
    data['android_token'] = this.androidToken;
    data['ios_token'] = this.iosToken;
    data['verified'] = this.verified;
    data['financial_approval'] = this.financialApproval;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['cover_img'] = this.coverImg;
    data['headline'] = this.headline;
    data['about'] = this.about;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['location'] = this.location;
    data['level_of_training'] = this.levelOfTraining;
    data['meeting_type'] = this.meetingType;
    data['status'] = this.status;
    data['language'] = this.language;
    data['timezone'] = this.timezone;
    data['newsletter'] = this.newsletter;
    data['public_message'] = this.publicMessage;
    data['account_type'] = this.accountType;
    data['iban'] = this.iban;
    data['account_id'] = this.accountId;
    data['identity_scan'] = this.identityScan;
    data['certificate'] = this.certificate;
    data['commission'] = this.commission;
    data['affiliate'] = this.affiliate;
    data['ban'] = this.ban;
    data['ban_start_at'] = this.banStartAt;
    data['ban_end_at'] = this.banEndAt;
    data['offline'] = this.offline;
    data['offline_message'] = this.offlineMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['rate'] = this.rate;
    return data;
  }
}

class Therapists {
  int? id;
  String? fullName;
  String? roleName;
  String? teacherType;
  int? price30;
  int? price45;
  dynamic? organId;
  dynamic? deviceId;
  dynamic? mobile;
  String? email;
  String? balance;
  dynamic? facebook;
  dynamic? parentMobile;
  dynamic? bio;
  int? isFeature;
  dynamic? orderBy;
  dynamic? androidToken;
  dynamic? iosToken;
  int? verified;
  int? financialApproval;
  dynamic? avatar;
  String? gender;
  dynamic? birthDate;
  dynamic? coverImg;
  dynamic? headline;
  dynamic? about;
  dynamic? address;
  dynamic? countryId;
  dynamic? provinceId;
  dynamic? cityId;
  dynamic? districtId;
  dynamic? location;
  dynamic? levelOfTraining;
  String? meetingType;
  String? status;
  dynamic? language;
  dynamic? timezone;
  int? newsletter;
  int? publicMessage;
  dynamic? accountType;
  dynamic? iban;
  dynamic? accountId;
  dynamic? identityScan;
  dynamic? certificate;
  dynamic? commission;
  int? affiliate;
  int? ban;
  dynamic? banStartAt;
  dynamic? banEndAt;
  int? offline;
  dynamic? offlineMessage;
  int? createdAt;
  dynamic? updatedAt;
  dynamic? deletedAt;
  String? rate;

  Therapists(
      {this.id,
        this.fullName,
        this.roleName,
        this.teacherType,
        this.price30,
        this.price45,
        this.organId,
        this.deviceId,
        this.mobile,
        this.email,
        this.balance,
        this.facebook,
        this.parentMobile,
        this.bio,
        this.isFeature,
        this.orderBy,
        this.androidToken,
        this.iosToken,
        this.verified,
        this.financialApproval,
        this.avatar,
        this.gender,
        this.birthDate,
        this.coverImg,
        this.headline,
        this.about,
        this.address,
        this.countryId,
        this.provinceId,
        this.cityId,
        this.districtId,
        this.location,
        this.levelOfTraining,
        this.meetingType,
        this.status,
        this.language,
        this.timezone,
        this.newsletter,
        this.publicMessage,
        this.accountType,
        this.iban,
        this.accountId,
        this.identityScan,
        this.certificate,
        this.commission,
        this.affiliate,
        this.ban,
        this.banStartAt,
        this.banEndAt,
        this.offline,
        this.offlineMessage,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.rate});

  Therapists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    teacherType = json['teacher_type'];
    price30 = json['price_30'];
    price45 = json['price_45'];
    organId = json['organ_id'];
    deviceId = json['device_id'];
    mobile = json['mobile'];
    email = json['email'];
    balance = json['balance'];
    facebook = json['facebook'];
    parentMobile = json['parent_mobile'];
    bio = json['bio'];
    isFeature = json['is_feature'];
    orderBy = json['order_by'];
    androidToken = json['android_token'];
    iosToken = json['ios_token'];
    verified = json['verified'];
    financialApproval = json['financial_approval'];
    avatar = json['avatar'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    coverImg = json['cover_img'];
    headline = json['headline'];
    about = json['about'];
    address = json['address'];
    countryId = json['country_id'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    location = json['location'];
    levelOfTraining = json['level_of_training'];
    meetingType = json['meeting_type'];
    status = json['status'];
    language = json['language'];
    timezone = json['timezone'];
    newsletter = json['newsletter'];
    publicMessage = json['public_message'];
    accountType = json['account_type'];
    iban = json['iban'];
    accountId = json['account_id'];
    identityScan = json['identity_scan'];
    certificate = json['certificate'];
    commission = json['commission'];
    affiliate = json['affiliate'];
    ban = json['ban'];
    banStartAt = json['ban_start_at'];
    banEndAt = json['ban_end_at'];
    offline = json['offline'];
    offlineMessage = json['offline_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['teacher_type'] = this.teacherType;
    data['price_30'] = this.price30;
    data['price_45'] = this.price45;
    data['organ_id'] = this.organId;
    data['device_id'] = this.deviceId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['balance'] = this.balance;
    data['facebook'] = this.facebook;
    data['parent_mobile'] = this.parentMobile;
    data['bio'] = this.bio;
    data['is_feature'] = this.isFeature;
    data['order_by'] = this.orderBy;
    data['android_token'] = this.androidToken;
    data['ios_token'] = this.iosToken;
    data['verified'] = this.verified;
    data['financial_approval'] = this.financialApproval;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['cover_img'] = this.coverImg;
    data['headline'] = this.headline;
    data['about'] = this.about;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['location'] = this.location;
    data['level_of_training'] = this.levelOfTraining;
    data['meeting_type'] = this.meetingType;
    data['status'] = this.status;
    data['language'] = this.language;
    data['timezone'] = this.timezone;
    data['newsletter'] = this.newsletter;
    data['public_message'] = this.publicMessage;
    data['account_type'] = this.accountType;
    data['iban'] = this.iban;
    data['account_id'] = this.accountId;
    data['identity_scan'] = this.identityScan;
    data['certificate'] = this.certificate;
    data['commission'] = this.commission;
    data['affiliate'] = this.affiliate;
    data['ban'] = this.ban;
    data['ban_start_at'] = this.banStartAt;
    data['ban_end_at'] = this.banEndAt;
    data['offline'] = this.offline;
    data['offline_message'] = this.offlineMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['rate'] = this.rate;
    return data;
  }
}