class CreateConsultatResponse {
  bool? success;
  String? status;
  String? message;

  CreateConsultatResponse({this.success, this.status, this.message});

  CreateConsultatResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}