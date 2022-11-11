import 'package:json_annotation/json_annotation.dart';

import '../service/service.dart';
part 'package.g.dart';

@JsonSerializable()
class Package {
  int id;
  String? name;
  int? duration;
  int active;
  int serviceId;
  double? price;
  Service? service;

  Package(this.id, this.name, this.duration, this.active, this.serviceId,
      this.price, this.service);

  factory Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);
  Map<String, dynamic> toJson() => _$PackageToJson(this);
}
