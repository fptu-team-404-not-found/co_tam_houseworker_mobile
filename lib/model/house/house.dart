import 'package:json_annotation/json_annotation.dart';

import '../building/building.dart';
import '../customer/customer.dart';
part 'house.g.dart';

@JsonSerializable()
class House {
    int? id;
    String? number;
    bool? active;
    int? customerId;
    int? buildingId;
    Building? building;
    Customer? customer;

    House(
        {this.id,
          this.number,
          this.active,
          this.customerId,
          this.buildingId,
          this.building,
          this.customer});

    factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
    Map<String, dynamic> toJson() => _$HouseToJson(this);
}