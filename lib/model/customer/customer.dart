import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
    int? id;
    String? name;
    String? phone;
    String? dateOfBirth;
    String? email;
    String? linkFacebook;
    String? avatar;
    double? eWallet;
    bool? active;
    Object? customerPromotions;

    Customer(
        {this.id,
          this.name,
          this.phone,
          this.dateOfBirth,
          this.email,
          this.linkFacebook,
          this.avatar,
          this.eWallet,
          this.active,
          this.customerPromotions});

    factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
    Map<String, dynamic> toJson() => _$CustomerToJson(this);
}