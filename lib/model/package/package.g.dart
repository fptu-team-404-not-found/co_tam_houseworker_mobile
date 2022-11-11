// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
      json['id'] as int,
      json['name'] as String?,
      json['duration'] as int?,
      json['active'] as int,
      json['serviceId'] as int,
      (json['price'] as num?)?.toDouble(),
      json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'active': instance.active,
      'serviceId': instance.serviceId,
      'price': instance.price,
      'service': instance.service,
    };
