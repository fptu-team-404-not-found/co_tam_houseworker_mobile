import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/information/order_information/order_information_tag.dart';
import 'order_controller.dart';

class OrderHistoryPage extends View {
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
      backgroundColor: Colors.blue,
      strokeWidth: 4.0,
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
}