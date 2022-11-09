import 'package:co_tam_houseworker_mobile/model/houseworker/houseworker.dart';
import 'package:co_tam_houseworker_mobile/model/order/order.dart';
import 'package:json_annotation/json_annotation.dart';
part 'worker_in_order.g.dart';

@JsonSerializable()
class WorkerInOrder {
    int id;
    int houseWorkerId;
    int orderId;
    int? rating;
    Houseworker houseWorker;
    Order order;

    WorkerInOrder(this.id, this.houseWorkerId, this.orderId, this.rating,
        this.houseWorker, this.order);

    factory WorkerInOrder.fromJson(Map<String, dynamic> json) => _$WorkerInOrderFromJson(json);
    Map<String, dynamic> toJson() => _$WorkerInOrderToJson(this);
}