import 'package:json_annotation/json_annotation.dart';
part 'promotion.g.dart';

@JsonSerializable()
class Promotion {
  int id;
  String code;
  String? description;
  double? value;
  double? discount;
  int? amount;
  DateTime? startDate;
  DateTime? endDate;
  bool? active;
  String? image;

  Promotion(this.id, this.code, this.description, this.value, this.discount,
      this.amount, this.startDate, this.endDate, this.active, this.image);

  factory Promotion.fromJson(Map<String, dynamic> json) => _$PromotionFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionToJson(this);
}
