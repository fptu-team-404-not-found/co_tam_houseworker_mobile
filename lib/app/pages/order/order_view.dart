import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../widgets/app_bar/tab_controller.dart';
import '../../widgets/app_bar/top_app_bar.dart';
import 'order_controller.dart';

class OrderPage extends View {
  const OrderPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderPageView();
}

class OrderPageView extends ViewState<OrderPage, OrderController> {
  OrderPageView() : super(OrderController());

  @override
  Widget get view => const Scaffold(
    appBar: PreferredSize(preferredSize: Size.fromHeight(56), child: TopAppBar('ĐƠN HÀNG', null)),
    body: TabControllerWidget(),
  );
}