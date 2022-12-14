

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/customer/customer.dart';
import '../../../model/order/order.dart';
import '../../../repositories/customer_repository.dart';
import '../../../repositories/order_repository.dart';
import '../../utils/constant.dart';
import '../../widgets/app_bar/top_app_bar.dart';
import '../../widgets/information/icon_text_information.dart';
import '../../widgets/information/order_information/order_details_information_card.dart';
import '../../widgets/information/order_information/order_details_summary.dart';
import '../../widgets/information/person_information_card.dart';
import '../../widgets/state/order_status.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;

  const OrderDetailsPage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  Order? _order;
  Customer? _customer;

  @override
  void initState() {
    super.initState();
    _getOrderById();
  }

  void _getOrderById() async {
    _order = await OrderRepository().getOrderById(widget.orderId);
    if (_order != null) {
      _customer = await CustomerRepository().getCustomerById(_order!.house!.customerId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(preferredSize: Size.fromHeight(56), child: TopAppBar('CHI TIẾT ĐƠN', FontAwesomeIcons.circleArrowLeft, null, null)),
        body: Scaffold(
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            color: AppColor.secondaryColor100,
            backgroundColor: AppColor.primaryColor100,
            strokeWidth: 2.0,
            onRefresh: () async {
              //_getOrderById();
              return Future<void>.delayed(const Duration(seconds: 20));
            },
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 12),
                      IconTextInformation(FontAwesomeIcons.locationDot, informationDetails: 'Phòng ' + _order!.house!.number!.trim() + ', ' + _order!.house!.building!.name.toString() + ', ' + _order!.house!.building!.area!.name.toString()),
                      const SizedBox(height: 12),
                      OrderStatus(status: _order!.orderState!),
                      const SizedBox(height: 12),
                      PersonInformationCard(customer: _customer),
                      const SizedBox(height: 12),
                      OrderDetailsInformationCard(order: _order!),
                      const SizedBox(height: 12),
                      OrderDetailsSummary(order: _order!),
                      const SizedBox(height: 68)
                    ]
                )
            ),
          ),
        )
    );
  }
}

