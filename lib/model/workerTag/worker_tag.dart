import 'package:json_annotation/json_annotation.dart';
part 'worker_tag.g.dart';

@JsonSerializable()
class WorkerTag {
    int? id;
    String? name;
    int? houseWorkerId;
    String? houseWorker;

    WorkerTag({this.id, this.name, this.houseWorkerId, this.houseWorker});

    factory WorkerTag.fromJson(Map<String, dynamic> json) => _$WorkerTagFromJson(json);
    Map<String, dynamic> toJson() => _$WorkerTagToJson(this);
}