// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

House _$HouseFromJson(Map<String, dynamic> json) => House(
      id: json['id'] as int?,
      number: json['number'] as String?,
      active: json['active'] as bool?,
      customerId: json['customerId'] as int?,
      buildingId: json['buildingId'] as int?,
      building: json['building'] == null
          ? null
          : Building.fromJson(json['building'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HouseToJson(House instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'active': instance.active,
      'customerId': instance.customerId,
      'buildingId': instance.buildingId,
      'building': instance.building,
      'customer': instance.customer,
    };
