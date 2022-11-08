import 'package:json_annotation/json_annotation.dart';
part 'token.g.dart';

@JsonSerializable()
class Token {
  Data? data;
  bool? success;
  String? message;

  Token({this.data, this.success, this.message});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class Data {
  String? accessToken;
  String? refreshToken;

  Data({this.accessToken, this.refreshToken});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}