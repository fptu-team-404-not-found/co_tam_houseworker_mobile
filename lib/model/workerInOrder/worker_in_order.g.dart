// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_in_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerInOrder _$WorkerInOrderFromJson(Map<String, dynamic> json) =>
    WorkerInOrder(
      json['id'] as int,
      json['houseWorkerId'] as int,
      json['orderId'] as int,
      json['rating'] as int?,
      Houseworker.fromJson(json['houseWorker'] as Map<String, dynamic>),
      Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkerInOrderToJson(WorkerInOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseWorkerId': instance.houseWorkerId,
      'orderId': instance.orderId,
      'rating': instance.rating,
      'houseWorker': instance.houseWorker,
      'order': instance.order,
    };
