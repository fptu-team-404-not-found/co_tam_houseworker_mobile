import 'package:co_tam_houseworker_mobile/app/pages/order/order_details.dart';
import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/model/workerInOrder/worker_in_order.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../repositories/package_repository.dart';

import '../../../repositories/worker_in_order_repository.dart';
import '../../utils/routes.dart';
import '../../widgets/information/order_information/order_information_tag.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late List<WorkerInOrder>? _workerInOrders;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getWorkerInOrders();
  }

  void _getWorkerInOrders() async {
    _workerInOrders =
        await WorkerInOrderRepository().getListWorkerInOrderByHouseWorkerId();
    if (_workerInOrders != null) {
      for (var wio in _workerInOrders!) {
        wio.order.package =
            await PackageRepository().getPackageById(wio.order.packageId);
      }
    }
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
                      return GestureDetector(
                          /*onTap: () async {
                             int orderId = _workerInOrders![index].orderId;
                             Navigator.pushNamed(context, Routes.orderDetailsPage, arguments: orderId);
                          },*/
                        child: OrderInformationTag(
                            iconData: FontAwesomeIcons.fileInvoiceDollar,
                            mainInfo: _workerInOrders![index]
                                .order
                                .package!
                                .service!
                                .name
                                .toString(),
                            subInfo:
                            _workerInOrders![index].order.dateTime.toString(),
                            extraInfo:
                            _workerInOrders![index].order.total.toString()),
                        );
                    })),
          );
  }
}
