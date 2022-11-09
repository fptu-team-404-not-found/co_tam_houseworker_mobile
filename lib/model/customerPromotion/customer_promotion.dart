import 'package:json_annotation/json_annotation.dart';
part 'customer_promotion.g.dart';

@JsonSerializable()
class CustomerPromotion {
    int? id;
    bool? isUsed;
    int? customerId;
    int? promotionId;
    String? customer;
    String? promotion;

    CustomerPromotion(
        {this.id,
          this.isUsed,
          this.customerId,
          this.promotionId,
          this.customer,
          this.promotion});
    
    factory CustomerPromotion.fromJson(Map<String, dynamic> json) => _$CustomerPromotionFromJson(json);
    Map<String, dynamic> toJson() => _$CustomerPromotionToJson(this);
}