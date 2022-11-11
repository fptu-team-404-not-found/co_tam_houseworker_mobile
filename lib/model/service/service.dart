import 'package:json_annotation/json_annotation.dart';
part 'service.g.dart';

@JsonSerializable()
class Service {
  int id;
  String name;
  String? description;
  int active;

  Service(this.id, this.name, this.description, this.active);

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
