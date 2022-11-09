import 'package:json_annotation/json_annotation.dart';

import '../house/house.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
    int? id;
    String? endTime;
    String? dateTime;
    double? subTotal;
    double? total;
    int? houseId;
    int? packageId;
    int? promotionId;
    int? paymentMethodId;
    int? orderState;
    House? house;

    Order(
        this.id,
        this.endTime,
        this.dateTime,
        this.subTotal,
        this.total,
        this.houseId,
        this.packageId,
        this.promotionId,
        this.paymentMethodId,
        this.orderState,
        this.house);
  /*Package? package;
    PaymentMethod? paymentMethod;
    Promotion? promotion;*/

    factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
    Map<String, dynamic> toJson() => _$OrderToJson(this);
}