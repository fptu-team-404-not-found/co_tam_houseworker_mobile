import 'package:json_annotation/json_annotation.dart';

import '../manager/manager.dart';
part 'houseworker.g.dart';

@JsonSerializable()
class Houseworker {
    int? id;
    String? name;
    String? phone;
    String? dateOfBirth;
    String? email;
    String? linkFacebook;
    String? avatar;
    int? active;
    int? areaId;
    int? managerId;
    Manager? manager;
    Object? workerInOrders;
    Object? workerTags;

    Houseworker(
      this.id,
      this.name,
      this.phone,
      this.dateOfBirth,
      this.email,
      this.linkFacebook,
      this.avatar,
      this.active,
      this.areaId,
      this.managerId,
      this.manager,
      this.workerInOrders,
      this.workerTags);

    factory Houseworker.fromJson(Map<String, dynamic> json) => _$HouseworkerFromJson(json);
    Map<String, dynamic> toJson() => _$HouseworkerToJson(this);
}