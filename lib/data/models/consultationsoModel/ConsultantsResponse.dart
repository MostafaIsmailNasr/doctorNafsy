class ConsultantsResponse {
  bool? success;
  String? status;
  String? message;
  List<Consultant>? data;

  ConsultantsResponse({this.success, this.status, this.message, this.data});

  ConsultantsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Consultant>[];
      json['data'].forEach((v) {
        data!.add(new Consultant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Consultant {
  int? id;
  String? sessionDuration;
  String? date;
  String? startTime;
  String? endTime;
  String? meetingLink;
  int? price;
  int? doctorId;
  int? userId;
  int? createdAt;
  Doctor? doctor;

  Consultant(
      {this.id,
        this.sessionDuration,
        this.date,
        this.startTime,
        this.endTime,
        this.price,
        this.doctorId,
        this.userId,
        this.meetingLink,
        this.createdAt,
        this.doctor});

  Consultant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionDuration = json['session_duration'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    price = json['price'];
    doctorId = json['doctor_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    meetingLink =  json['meeting_link'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['session_duration'] = this.sessionDuration;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['price'] = this.price;
    data['doctor_id'] = this.doctorId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['meeting_link']=this.meetingLink;
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

  Doctor(
      {this.id, this.fullName, this.roleName, this.teacherType, this.avatar});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    teacherType = json['teacher_type'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['teacher_type'] = this.teacherType;
    data['avatar'] = this.avatar;
    return data;
  }
}