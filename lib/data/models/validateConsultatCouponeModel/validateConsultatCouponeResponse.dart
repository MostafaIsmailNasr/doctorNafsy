class validateConsultatCouponeResponse {
  bool? success;
  String? status;
  String? message;
  Data? data;

  validateConsultatCouponeResponse(
      {this.success, this.status, this.message, this.data});

  validateConsultatCouponeResponse.fromJson(Map<String, dynamic> json) {
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
  int? creatorId;
  String? addedBy;
  dynamic? instructorId;
  dynamic? cityId;
  dynamic? organId;
  String? title;
  String? discountType;
  String? source;
  String? code;
  int? percent;
  int? amount;
  dynamic? maxAmount;
  dynamic? minimumOrder;
  int? count;
  dynamic? userType;
  int? forFirstPurchase;
  String? status;
  String? type;
  int? expiredAt;
  int? createdAt;
  int? codeLength;

  Data(
      {this.id,
        this.creatorId,
        this.addedBy,
        this.instructorId,
        this.cityId,
        this.organId,
        this.title,
        this.discountType,
        this.source,
        this.code,
        this.percent,
        this.amount,
        this.maxAmount,
        this.minimumOrder,
        this.count,
        this.userType,
        this.forFirstPurchase,
        this.status,
        this.type,
        this.expiredAt,
        this.createdAt,
        this.codeLength});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorId = json['creator_id'];
    addedBy = json['added_by'];
    instructorId = json['instructor_id'];
    cityId = json['city_id'];
    organId = json['organ_id'];
    title = json['title'];
    discountType = json['discount_type'];
    source = json['source'];
    code = json['code'];
    percent = json['percent'];
    amount = json['amount'];
    maxAmount = json['max_amount'];
    minimumOrder = json['minimum_order'];
    count = json['count'];
    userType = json['user_type'];
    forFirstPurchase = json['for_first_purchase'];
    status = json['status'];
    type = json['type'];
    expiredAt = json['expired_at'];
    createdAt = json['created_at'];
    codeLength = json['code_length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creator_id'] = this.creatorId;
    data['added_by'] = this.addedBy;
    data['instructor_id'] = this.instructorId;
    data['city_id'] = this.cityId;
    data['organ_id'] = this.organId;
    data['title'] = this.title;
    data['discount_type'] = this.discountType;
    data['source'] = this.source;
    data['code'] = this.code;
    data['percent'] = this.percent;
    data['amount'] = this.amount;
    data['max_amount'] = this.maxAmount;
    data['minimum_order'] = this.minimumOrder;
    data['count'] = this.count;
    data['user_type'] = this.userType;
    data['for_first_purchase'] = this.forFirstPurchase;
    data['status'] = this.status;
    data['type'] = this.type;
    data['expired_at'] = this.expiredAt;
    data['created_at'] = this.createdAt;
    data['code_length'] = this.codeLength;
    return data;
  }
}