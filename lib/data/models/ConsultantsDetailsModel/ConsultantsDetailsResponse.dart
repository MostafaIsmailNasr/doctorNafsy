class ConsultantsDetailsResponse {
  bool? success;
  String? status;
  String? message;
  Data? data;

  ConsultantsDetailsResponse(
      {this.success, this.status, this.message, this.data});

  ConsultantsDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? sessionDuration;
  String? service;
  String? date;
  String? startTime;
  String? endTime;
  String? meetingLink;
  int? price;
  Null? payment;
  int? doctorId;
  int? userId;
  int? createdAt;
  Doctor? doctor;

  Data(
      {this.id,
        this.sessionDuration,
        this.service,
        this.date,
        this.startTime,
        this.endTime,
        this.meetingLink,
        this.price,
        this.payment,
        this.doctorId,
        this.userId,
        this.createdAt,
        this.doctor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionDuration = json['session_duration'];
    service = json['service'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    meetingLink = json['meeting_link'];
    price = json['price'];
    payment = json['payment'];
    doctorId = json['doctor_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['session_duration'] = this.sessionDuration;
    data['service'] = this.service;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['meeting_link']= this.meetingLink ;
    data['price'] = this.price;
    data['payment'] = this.payment;
    data['doctor_id'] = this.doctorId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? fullName;
  String? roleName;
  String? teacherType;
  String? avatar;
  String? rate;

  Doctor(
      {this.id,
        this.fullName,
        this.roleName,
        this.teacherType,
        this.avatar,
        this.rate});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    teacherType = json['teacher_type'];
    avatar = json['avatar'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['teacher_type'] = this.teacherType;
    data['avatar'] = this.avatar;
    data['rate'] = this.rate;
    return data;
  }
}