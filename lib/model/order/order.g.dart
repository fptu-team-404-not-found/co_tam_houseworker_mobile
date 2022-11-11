// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['id'] as int?,
      json['endTime'] as String?,
      json['dateTime'] as String?,
      (json['subTotal'] as num?)?.toDouble(),
      (json['total'] as num?)?.toDouble(),
      json['houseId'] as int?,
      json['packageId'] as int?,
      json['promotionId'] as int?,
      json['paymentMethodId'] as int?,
      json['orderState'] as int?,
      json['house'] == null
          ? null
          : House.fromJson(json['house'] as Map<String, dynamic>),
      json['package'] == null
          ? null
          : Package.fromJson(json['package'] as Map<String, dynamic>),
      json['paymentMethod'] == null
          ? null
          : PaymentMethod.fromJson(
              json['paymentMethod'] as Map<String, dynamic>),
      json['promotion'] == null
          ? null
          : Promotion.fromJson(json['promotion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'endTime': instance.endTime,
      'dateTime': instance.dateTime,
      'subTotal': instance.subTotal,
      'total': instance.total,
      'houseId': instance.houseId,
      'packageId': instance.packageId,
      'promotionId': instance.promotionId,
      'paymentMethodId': instance.paymentMethodId,
      'orderState': instance.orderState,
      'house': instance.house,
      'package': instance.package,
      'paymentMethod': instance.paymentMethod,
      'promotion': instance.promotion,
    };
