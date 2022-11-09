
import 'package:json_annotation/json_annotation.dart';
part 'area.g.dart';

@JsonSerializable()
class Area {
    int? id;
    String? name;
    bool? active;
    String? district;
    String? city;

    Area(
        {this.id,
          this.name,
          this.active,
          this.district,
          this.city,});

    factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
    Map<String, dynamic> toJson() => _$AreaToJson(this);
}