import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/model/workerInOrder/worker_in_order.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../repositories/worker_in_order_repository.dart';
import '../../widgets/information/order_information/order_information_tag.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  late List<WorkerInOrder>? _workerInOrders;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getWorkerInOrders();
  }

  void _getWorkerInOrders() async {
    _workerInOrders = await WorkerInOrderRepository().getListWorkerInOrderByHouseWorkerId();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
          child: CircularProgressIndicator(
            color: AppColor.secondaryColor100,
            backgroundColor: AppColor.primaryColor100,
            strokeWidth: 2.0,
          ),
        )
        : Scaffold(
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            color: AppColor.secondaryColor100,
            backgroundColor: AppColor.primaryColor100,
            strokeWidth: 2.0,
            onRefresh: () async {
              _getWorkerInOrders();
              return Future<void>.delayed(const Duration(seconds: 3));
            },
            child: ListView.builder(
              itemCount: _workerInOrders!.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderInformationTag(
                  iconData: FontAwesomeIcons.fileInvoiceDollar,
                  mainInfo: _workerInOrders![index].orderId.toString(),
                  subInfo: '21-10-2022',
                  extraInfo: '60.000Đ'
                );
              }
            )
      ),
    );
  }
}