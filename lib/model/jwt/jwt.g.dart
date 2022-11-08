// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JWT _$JWTFromJson(Map<String, dynamic> json) => JWT(
      json['nameid'] as String,
      json['id'] as String,
      json['email'] as String,
      json['name'] as String,
      json['role'] as String,
      json['jti'] as String,
      json['nbf'] as int,
      json['exp'] as int,
      json['iat'] as int,
    );

Map<String, dynamic> _$JWTToJson(JWT instance) => <String, dynamic>{
      'nameid': instance.nameid,
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'jti': instance.jti,
      'nbf': instance.nbf,
      'exp': instance.exp,
      'iat': instance.iat,
    };
