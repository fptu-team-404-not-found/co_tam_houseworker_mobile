import 'package:json_annotation/json_annotation.dart';

import '../area/area.dart';
part 'building.g.dart';

@JsonSerializable()
class Building {
    int? id;
    String? name;
    bool? active;
    int? areaId;
    Area? area;

    Building(
        {this.id, this.name, this.active, this.areaId, this.area});

    factory Building.fromJson(Map<String, dynamic> json) => _$BuildingFromJson(json);
    Map<String, dynamic> toJson() => _$BuildingToJson(this);
}