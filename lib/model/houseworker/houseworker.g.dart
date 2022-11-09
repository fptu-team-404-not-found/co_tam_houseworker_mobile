// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'houseworker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Houseworker _$HouseworkerFromJson(Map<String, dynamic> json) => Houseworker(
      json['id'] as int?,
      json['name'] as String?,
      json['phone'] as String?,
      json['dateOfBirth'] as String?,
      json['email'] as String?,
      json['linkFacebook'] as String?,
      json['avatar'] as String?,
      json['active'] as int?,
      json['areaId'] as int?,
      json['managerId'] as int?,
      json['manager'] == null
          ? null
          : Manager.fromJson(json['manager'] as Map<String, dynamic>),
      json['workerInOrders'],
      json['workerTags'],
    );

Map<String, dynamic> _$HouseworkerToJson(Houseworker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth,
      'email': instance.email,
      'linkFacebook': instance.linkFacebook,
      'avatar': instance.avatar,
      'active': instance.active,
      'areaId': instance.areaId,
      'managerId': instance.managerId,
      'manager': instance.manager,
      'workerInOrders': instance.workerInOrders,
      'workerTags': instance.workerTags,
    };
