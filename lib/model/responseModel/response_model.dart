import 'package:json_annotation/json_annotation.dart';
part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  dynamic data;
  bool? success;
  String? message;
  int statusCode;

  ResponseModel(this.data, this.success, this.message, this.statusCode);

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}