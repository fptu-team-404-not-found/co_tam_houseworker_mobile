// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as int?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      district: json['district'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'district': instance.district,
      'city': instance.city,
    };
