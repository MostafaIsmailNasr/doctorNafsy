class SearchListResponse {
  bool? success;
  String? status;
  String? message;
  Data? data;

  SearchListResponse({this.success, this.status, this.message, this.data});

  SearchListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  Webinars? webinars;
  Teachers? teachers;

  Data({this.webinars, this.teachers});

  Data.fromJson(Map<String, dynamic> json) {
    webinars = json['webinars'] != null
        ? new Webinars.fromJson(json['webinars'])
        : null;
    teachers = json['teachers'] != null
        ? new Teachers.fromJson(json['teachers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.webinars != null) {
      data['webinars'] = this.webinars!.toJson();
    }
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.toJson();
    }
    return data;
  }
}

class Webinars {
  List<Webinars2>? webinars;
  int? count;

  Webinars({this.webinars, this.count});

  Webinars.fromJson(Map<String, dynamic> json) {
    if (json['webinars'] != null) {
      webinars = <Webinars2>[];
      json['webinars'].forEach((v) {
        webinars!.add(new Webinars2.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.webinars != null) {
      data['webinars'] = this.webinars!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Webinars2 {
  String? image;
  int? id;
  int? teacherId;
  int? creatorId;
  int? categoryId;
  int? groupId;
  int? organId;
  int? cityId;
  String? type;
  int? private;
  String? slug;
  dynamic? startDate;
  int? duration;
  dynamic? timezone;
  String? thumbnail;
  String? imageCover;
  dynamic? videoDemo;
  dynamic? videoDemoSource;
  dynamic? capacity;
  dynamic? price;
  dynamic? priceAfterDisscount;
  dynamic? onlinePrice;
  dynamic? onlinePriceAfterDisscount;
  int? support;
  int? downloadable;
  int? partnerInstructor;
  int? subscribe;
  dynamic? points;
  int? redeemPoints;
  dynamic? messageForReviewer;
  String? status;
  int? createdAt;
  int? updatedAt;
  dynamic? deletedAt;
  String? title;
  dynamic? description;
  dynamic? seoDescription;
  Teacher? teacher;

  Webinars2(
      {this.image,
        this.id,
        this.teacherId,
        this.creatorId,
        this.categoryId,
        this.groupId,
        this.organId,
        this.cityId,
        this.type,
        this.private,
        this.slug,
        this.startDate,
        this.duration,
        this.timezone,
        this.thumbnail,
        this.imageCover,
        this.videoDemo,
        this.videoDemoSource,
        this.capacity,
        this.price,
        this.priceAfterDisscount,
        this.onlinePrice,
        this.onlinePriceAfterDisscount,
        this.support,
        this.downloadable,
        this.partnerInstructor,
        this.subscribe,
        this.points,
        this.redeemPoints,
        this.messageForReviewer,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.title,
        this.description,
        this.seoDescription,
        this.teacher,});

  Webinars2.fromJson(Map<String, dynamic> json) {
    image=json['image'];
    id = json['id'];
    teacherId = json['teacher_id'];
    creatorId = json['creator_id'];
    categoryId = json['category_id'];
    groupId = json['group_id'];
    organId = json['organ_id'];
    cityId = json['city_id'];
    type = json['type'];
    private = json['private'];
    slug = json['slug'];
    startDate = json['start_date'];
    duration = json['duration'];
    timezone = json['timezone'];
    thumbnail = json['thumbnail'];
    imageCover = json['image_cover'];
    videoDemo = json['video_demo'];
    videoDemoSource = json['video_demo_source'];
    capacity = json['capacity'];
    price = json['price'];
    priceAfterDisscount = json['price_after_disscount'];
    onlinePrice = json['online_price'];
    onlinePriceAfterDisscount = json['online_price_after_disscount'];
    support = json['support'];
    downloadable = json['downloadable'];
    partnerInstructor = json['partner_instructor'];
    subscribe = json['subscribe'];
    points = json['points'];
    redeemPoints = json['redeem_points'];
    messageForReviewer = json['message_for_reviewer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    title = json['title'];
    description = json['description'];
    seoDescription = json['seo_description'];
    teacher = json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
     data['image'] = this.image;
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['creator_id'] = this.creatorId;
    data['category_id'] = this.categoryId;
    data['group_id'] = this.groupId;
    data['organ_id'] = this.organId;
    data['city_id'] = this.cityId;
    data['type'] = this.type;
    data['private'] = this.private;
    data['slug'] = this.slug;
    data['start_date'] = this.startDate;
    data['duration'] = this.duration;
    data['timezone'] = this.timezone;
    data['thumbnail'] = this.thumbnail;
    data['image_cover'] = this.imageCover;
    data['video_demo'] = this.videoDemo;
    data['video_demo_source'] = this.videoDemoSource;
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    data['price_after_disscount'] = this.priceAfterDisscount;
    data['online_price'] = this.onlinePrice;
    data['online_price_after_disscount'] = this.onlinePriceAfterDisscount;
    data['support'] = this.support;
    data['downloadable'] = this.downloadable;
    data['partner_instructor'] = this.partnerInstructor;
    data['subscribe'] = this.subscribe;
    data['points'] = this.points;
    data['redeem_points'] = this.redeemPoints;
    data['message_for_reviewer'] = this.messageForReviewer;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['seo_description'] = this.seoDescription;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}
class Teacher {
  int? id;
  String? fullName;
  String? roleName;
  dynamic? teacherType;
  dynamic? price30;
  dynamic? price45;
  dynamic? deviceId;
  dynamic? bio;

  Teacher(
      {this.id,
        this.fullName,
        this.roleName,
        this.teacherType,
        this.price30,
        this.price45,
        this.deviceId,
        this.bio,});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    teacherType = json['teacher_type'];
    price30 = json['price_30'];
    price45 = json['price_45'];
    deviceId = json['device_id'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['teacher_type'] = this.teacherType;
    data['price_30'] = this.price30;
    data['price_45'] = this.price45;
    data['device_id'] = this.deviceId;
    data['bio'] = this.bio;
    return data;
  }
}

class Teachers {
  List<Teachers3>? teachers;
  int? count;

  Teachers({this.teachers, this.count});

  Teachers.fromJson(Map<String, dynamic> json) {
    if (json['teachers'] != null) {
      teachers = <Teachers3>[];
      json['teachers'].forEach((v) {
        teachers!.add(new Teachers3.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Teachers3 {
  int? id;
  String? fullName;
  String? roleName;
  int? price30;
  int? price45;
  dynamic? facebook;
  dynamic? mobile;
  dynamic? parentMobile;
  dynamic? deviceId;
  int? sonCoursesCount;
  int? sonQuizzesCount;
  String? bio;
  int? offline;
  dynamic? offlineMessage;
  int? verified;
  int? isVerified;
  String? rate;
  String? avatar;
  String? meetingStatus;
  bool? authUserIsFollower;
  dynamic? address;
  String? gender;
  dynamic? birthDate;
  String? createdAt;
  Categories? categories;
  UserGroup? userGroup;
  Organization? organization;
  City? city;
  String? teacherType;

  Teachers3(
      {this.id,
        this.fullName,
        this.roleName,
        this.price30,
        this.price45,
        this.facebook,
        this.mobile,
        this.parentMobile,
        this.deviceId,
        this.sonCoursesCount,
        this.sonQuizzesCount,
        this.bio,
        this.offline,
        this.offlineMessage,
        this.verified,
        this.isVerified,
        this.rate,
        this.avatar,
        this.meetingStatus,
        this.authUserIsFollower,
        this.address,
        this.gender,
        this.birthDate,
        this.createdAt,
        this.categories,
        this.userGroup,
        this.organization,
        this.city,this.teacherType});

  Teachers3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    price30 = json['price_30'];
    price45 = json['price_45'];
    facebook = json['facebook'];
    mobile = json['mobile'];
    parentMobile = json['parent_mobile'];
    deviceId = json['device_id'];
    sonCoursesCount = json['son_courses_count'];
    sonQuizzesCount = json['son_quizzes_count'];
    bio = json['bio'];
    offline = json['offline'];
    offlineMessage = json['offline_message'];
    verified = json['verified'];
    isVerified = json['is_verified'];
    rate = json['rate'];
    avatar = json['avatar'];
    meetingStatus = json['meeting_status'];
    authUserIsFollower = json['auth_user_is_follower'];
    address = json['address'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    createdAt = json['created_at'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    userGroup = json['user_group'] != null
        ? new UserGroup.fromJson(json['user_group'])
        : null;
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    teacherType=json['teacher_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['price_30'] = this.price30;
    data['price_45'] = this.price45;
    data['facebook'] = this.facebook;
    data['mobile'] = this.mobile;
    data['parent_mobile'] = this.parentMobile;
    data['device_id'] = this.deviceId;
    data['son_courses_count'] = this.sonCoursesCount;
    data['son_quizzes_count'] = this.sonQuizzesCount;
    data['bio'] = this.bio;
    data['offline'] = this.offline;
    data['offline_message'] = this.offlineMessage;
    data['verified'] = this.verified;
    data['is_verified'] = this.isVerified;
    data['rate'] = this.rate;
    data['avatar'] = this.avatar;
    data['meeting_status'] = this.meetingStatus;
    data['auth_user_is_follower'] = this.authUserIsFollower;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['created_at'] = this.createdAt;
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    if (this.userGroup != null) {
      data['user_group'] = this.userGroup!.toJson();
    }
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['teacher_type'] = this.teacherType;

    return data;
  }
}

class Categories {
  List<Null>? title;

  Categories({this.title});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['title'] != null) {
      title = <Null>[];
      json['title'].forEach((v) {
        //title!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      //data['title'] = this.title!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserGroup {
  int? id;
  String? name;
  String? status;
  dynamic commission;
  dynamic discount;

  UserGroup({this.id, this.name, this.status, this.commission, this.discount});

  UserGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    commission = json['commission'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['commission'] = this.commission;
    data['discount'] = this.discount;
    return data;
  }
}

class Organization {
  dynamic organId;
  dynamic organName;

  Organization({this.organId, this.organName});

  Organization.fromJson(Map<String, dynamic> json) {
    organId = json['organ_id'];
    organName = json['organ_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organ_id'] = this.organId;
    data['organ_name'] = this.organName;
    return data;
  }
}

class City {
  dynamic cityId;
  dynamic cityName;

  City({this.cityId, this.cityName});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    return data;
  }
}


