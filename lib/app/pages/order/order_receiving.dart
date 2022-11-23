import 'package:co_tam_houseworker_mobile/app/widgets/button/action_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/information/icon_text_information.dart';
import 'package:co_tam_houseworker_mobile/model/workerInOrder/worker_in_order.dart';
import 'package:co_tam_houseworker_mobile/repositories/customer_repository.dart';
import 'package:co_tam_houseworker_mobile/repositories/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/customer/customer.dart';
import '../../../model/order/order.dart';
import '../../../repositories/worker_in_order_repository.dart';
import '../../utils/constant.dart';
import '../../widgets/information/order_information/order_details_information_card.dart';
import '../../widgets/information/order_information/order_details_summary.dart';
import '../../widgets/information/person_information_card.dart';
import '../../widgets/state/order_status.dart';

class OrderReceivingPage extends StatefulWidget {
  const OrderReceivingPage({Key? key}) : super(key: key);

  @override
  State<OrderReceivingPage> createState() => _OrderReceivingPageState();
}

class _OrderReceivingPageState extends State<OrderReceivingPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  late Order _order;
  late Customer _customer;
  bool loading = true;
  bool haveOrder = false;

  @override
  void initState() {
    super.initState();
    _getOrderById();
  }

  void _getOrderById() async {
    WorkerInOrder? workerInOrderOnDoing = await WorkerInOrderRepository().getWorkerInOrderOnDoingByHouseWorkerId();
    if (workerInOrderOnDoing.order.id != null) {
      haveOrder = true;
    }
    _order = await OrderRepository().getOrderById(workerInOrderOnDoing.orderId);
    if (_order != null) {
      _customer = await CustomerRepository().getCustomerById(_order.house!.customerId);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? (WorkerInOrderRepository().getWorkerInOrderOnDoingByHouseWorkerId() != null
            ? const Center(child: Text('Hiện không có đơn hàng nào!'))
            : const Center(
              child: CircularProgressIndicator(
                color: AppColor.secondaryColor100,
                backgroundColor: AppColor.primaryColor100,
                strokeWidth: 2.0,
              ),
            )
        )
        : Scaffold(
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            color: AppColor.secondaryColor100,
            backgroundColor: AppColor.primaryColor100,
            strokeWidth: 2.0,
            onRefresh: () async {
              _getOrderById();
              return Future<void>.delayed(const Duration(seconds: 20));
            },
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    IconTextInformation(FontAwesomeIcons.locationDot, informationDetails: 'Phòng ' + _order.house!.number!.trim() + ', ' + _order.house!.building!.name.toString() + ', ' + _order.house!.building!.area!.name.toString()),
                    const SizedBox(height: 12),
                    OrderStatus(status: _order.orderState!),
                    const SizedBox(height: 12),
                    PersonInformationCard(customer: _customer),
                    const SizedBox(height: 12),
                    OrderDetailsInformationCard(order: _order),
                    const SizedBox(height: 12),
                    OrderDetailsSummary(order: _order),
                    const SizedBox(height: 68)
                  ]
              )
            ),
          ),
          floatingActionButton: ActionButton(numberOfButton: 1, status: _order.orderState!, orderId: _order.id!),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
  }
}