// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerTag _$WorkerTagFromJson(Map<String, dynamic> json) => WorkerTag(
      id: json['id'] as int?,
      name: json['name'] as String?,
      houseWorkerId: json['houseWorkerId'] as int?,
      houseWorker: json['houseWorker'] as String?,
    );

Map<String, dynamic> _$WorkerTagToJson(WorkerTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'houseWorkerId': instance.houseWorkerId,
      'houseWorker': instance.houseWorker,
    };
