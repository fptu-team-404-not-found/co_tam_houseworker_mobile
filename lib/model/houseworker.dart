class Houseworker {
  Data? data;
  bool success;
  String? message;
  int? statusCode;

  Houseworker({this.data, required this.success, this.message, this.statusCode});

  factory Houseworker.fromJson(Map<String, dynamic> json) {
    return Houseworker(
      data: json['data'] == null ? null : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'success': success,
      'message': message,
      "statusCode": statusCode,
    };
  }
}

class Data {
  String name;
  String? phone;
  String email;
  String? avatar;
  int? managerId;
  int? areaId;

  Data({required this.name, this.phone, required this.email, this.avatar, this.managerId, this.areaId});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      avatar: json['avatar'],
      managerId: json['managerId'],
      areaId: json['areaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'avatar': avatar,
      'managerId': managerId,
      'areaId': areaId,
    };
  }
}