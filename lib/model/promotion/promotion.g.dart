// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) => Promotion(
      json['id'] as int,
      json['code'] as String,
      json['description'] as String?,
      (json['value'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      json['amount'] as int?,
      json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      json['active'] as bool?,
      json['image'] as String?,
    );

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'value': instance.value,
      'discount': instance.discount,
      'amount': instance.amount,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'active': instance.active,
      'image': instance.image,
    };
