import 'package:co_tam_houseworker_mobile/model/role/role.dart';
import 'package:json_annotation/json_annotation.dart';
part 'manager.g.dart';

@JsonSerializable()
class Manager {
    int? id;
    String? name;
    String? phone;
    String? dateOfBirth;
    String? email;
    String? linkFacebook;
    String? avatar;
    bool? active;
    int? roleId;
    Role? role;
    Object? houseWorkers;

    Manager(
        {this.id,
          this.name,
          this.phone,
          this.dateOfBirth,
          this.email,
          this.linkFacebook,
          this.avatar,
          this.active,
          this.roleId,
          this.role,
          this.houseWorkers});

    factory Manager.fromJson(Map<String, dynamic> json) => _$ManagerFromJson(json);
    Map<String, dynamic> toJson() => _$ManagerToJson(this);
}