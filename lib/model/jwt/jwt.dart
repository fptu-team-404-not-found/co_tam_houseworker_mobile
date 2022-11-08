import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'jwt.g.dart';

@JsonSerializable()
class JWT {
  String nameid;
  String id;
  String email;
  String name;
  String role;
  String jti;
  int nbf;
  int exp;
  int iat;

  JWT(this.nameid, this.id, this.email, this.name, this.role, this.jti,
      this.nbf, this.exp, this.iat);

  factory JWT.fromJson(Map<String, dynamic> json) => _$JWTFromJson(json);

  Map<String, dynamic> toJson() => _$JWTToJson(this);
}