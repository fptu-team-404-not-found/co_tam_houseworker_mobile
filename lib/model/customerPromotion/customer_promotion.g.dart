// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPromotion _$CustomerPromotionFromJson(Map<String, dynamic> json) =>
    CustomerPromotion(
      id: json['id'] as int?,
      isUsed: json['isUsed'] as bool?,
      customerId: json['customerId'] as int?,
      promotionId: json['promotionId'] as int?,
      customer: json['customer'] as String?,
      promotion: json['promotion'] as String?,
    );

Map<String, dynamic> _$CustomerPromotionToJson(CustomerPromotion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isUsed': instance.isUsed,
      'customerId': instance.customerId,
      'promotionId': instance.promotionId,
      'customer': instance.customer,
      'promotion': instance.promotion,
    };
