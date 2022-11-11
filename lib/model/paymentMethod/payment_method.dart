import 'package:json_annotation/json_annotation.dart';
part 'payment_method.g.dart';

@JsonSerializable()
class PaymentMethod {
  int id;
  String name;
  bool? active;

  PaymentMethod(this.id, this.name, this.active);

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}