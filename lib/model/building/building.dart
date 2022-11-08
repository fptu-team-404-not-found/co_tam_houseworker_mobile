import 'package:json_annotation/json_annotation.dart';
part 'building.g.dart';

@JsonSerializable()
class Building {
  int id;
  String name;

  Building({required this.id, required this.name});

  factory Building.fromJson(Map<String, dynamic> json) => _$BuildingFromJson(json);
  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}