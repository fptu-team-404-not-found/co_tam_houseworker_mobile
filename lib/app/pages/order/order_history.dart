import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/model/workerInOrder/worker_in_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../repositories/worker_in_order_repository.dart';
import '../../widgets/information/order_information/order_information_tag.dart';
import 'order_controller.dart';

/*class OrderHistoryPage extends View {
  const OrderHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderHistoryPageView();
}

class OrderHistoryPageView extends ViewState<OrderHistoryPage, OrderController> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  OrderHistoryPageView() : super(OrderController());

  @override
  Widget get view => Scaffold(
    body: RefreshIndicator(
      key: _refreshIndicatorKey,
      color: Colors.white,
      backgroundColor: AppColor.primaryColor100,
      strokeWidth: 2.0,
      onRefresh: () async {
        // Replace this delay with the code to be executed during refresh
        // and return a Future when code finishs execution.
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      // Pull from top to show refresh indicator.
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return const OrderInformationTag(iconData: FontAwesomeIcons.dog, mainInfo: 'Dọn dẹp vệ sinh nhà cửa', subInfo: '21-10-2022', extraInfo: '60.000Đ');
        },
      ),
    ),
  );
}*/

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  Future<List<WorkerInOrder>?> fetchListWorkerInOrderByHouseWorkerId() {
    return getListWorkerInOrderByHouseWorkerId();
  }

  @override
  void initState() {
    fetchListWorkerInOrderByHouseWorkerId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: AppColor.primaryColor100,
        strokeWidth: 2.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },

        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return const OrderInformationTag(iconData: FontAwesomeIcons.dog, mainInfo: 'Dọn dẹp vệ sinh nhà cửa', subInfo: '21-10-2022', extraInfo: '60.000Đ');
          },
        ),
      ),
    );
  }
}