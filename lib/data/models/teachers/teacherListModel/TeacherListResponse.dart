class TeacherListResponse {
  bool? success;
  String? status;
  String? message;
  Data? data;

  TeacherListResponse({this.success, this.status, this.message, this.data});

  TeacherListResponse.fromJson(Map<String, dynamic> json) {
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
  List<doctor>? teachers;

  Data({this.teachers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['teachers'] != null) {
      teachers = <doctor>[];
      json['teachers'].forEach((v) {
        teachers!.add(new doctor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class doctor {
  int? id;
  String? fullName;
  dynamic? bio;
  dynamic? teacherType;
  dynamic? price30;
  dynamic? price45;
  String? rate;
  String? avatar;

  doctor(
      {this.id,
        this.fullName,
        this.bio,
        this.teacherType,
        this.price30,
        this.price45,
        this.rate,
        this.avatar});

  doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    bio = json['bio'];
    teacherType = json['teacher_type'];
    price30 = json['price_30'];
    price45 = json['price_45'];
    rate = json['rate'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['bio'] = this.bio;
    data['teacher_type'] = this.teacherType;
    data['price_30'] = this.price30;
    data['price_45'] = this.price45;
    data['rate'] = this.rate;
    data['avatar'] = this.avatar;
    return data;
  }
}