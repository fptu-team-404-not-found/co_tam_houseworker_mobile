// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manager _$ManagerFromJson(Map<String, dynamic> json) => Manager(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      email: json['email'] as String?,
      linkFacebook: json['linkFacebook'] as String?,
      avatar: json['avatar'] as String?,
      active: json['active'] as bool?,
      roleId: json['roleId'] as int?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      houseWorkers: json['houseWorkers'],
    );

Map<String, dynamic> _$ManagerToJson(Manager instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth,
      'email': instance.email,
      'linkFacebook': instance.linkFacebook,
      'avatar': instance.avatar,
      'active': instance.active,
      'roleId': instance.roleId,
      'role': instance.role,
      'houseWorkers': instance.houseWorkers,
    };
