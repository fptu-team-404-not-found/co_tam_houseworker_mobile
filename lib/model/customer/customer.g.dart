// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      email: json['email'] as String?,
      linkFacebook: json['linkFacebook'] as String?,
      avatar: json['avatar'] as String?,
      eWallet: (json['eWallet'] as num?)?.toDouble(),
      active: json['active'] as bool?,
      customerPromotions: json['customerPromotions'],
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth,
      'email': instance.email,
      'linkFacebook': instance.linkFacebook,
      'avatar': instance.avatar,
      'eWallet': instance.eWallet,
      'active': instance.active,
      'customerPromotions': instance.customerPromotions,
    };
