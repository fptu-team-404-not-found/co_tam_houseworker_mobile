import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/repositories/package_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/workerInOrder/worker_in_order.dart';
import '../../../repositories/order_repository.dart';
import '../../../repositories/worker_in_order_repository.dart';
import '../../widgets/information/order_information/order_information_tag.dart';

class OrderRatingPage extends StatefulWidget {
  const OrderRatingPage({Key? key}) : super(key: key);

  @override
  State<OrderRatingPage> createState() => _OrderRatingPageState();
}

class _OrderRatingPageState extends State<OrderRatingPage> {
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
    if (_workerInOrders != null) {
      for (var wio in _workerInOrders!) {
        wio.order.package = await PackageRepository().getPackageById(wio.order.packageId);
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
          child: _workerInOrders == null
              ? Center(child: Text('Không có đơn hàng nào'))
              : ListView.builder(
              itemCount: _workerInOrders!.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderInformationTag(
                    iconData: FontAwesomeIcons.faceSmileBeam,
                    mainInfo: _workerInOrders![index].order.package!.service!.name,
                    subInfo: _workerInOrders![index].order.total == null ? '' : _workerInOrders![index].order.total.toString(),
                    extraInfo: _workerInOrders![index].rating == null ? 'Chưa được đánh giá' : 'Đánh giá ' + _workerInOrders![index].rating.toString() + ' sao'
                );
              }
          )
      ),
    );
  }
}
