import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/app_bar/tab_controller.dart';
import '../../widgets/app_bar/top_app_bar.dart';
import 'order_controller.dart';

class OrderPage extends View {
  final int indexPage;

  const OrderPage({super.key, required this.indexPage});

  @override
  State<StatefulWidget> createState() => OrderPageView();
}

class OrderPageView extends ViewState<OrderPage, OrderController> {
  OrderPageView() : super(OrderController());

  @override
  Widget get view => Scaffold(
    appBar: const PreferredSize(preferredSize: Size.fromHeight(56), child: TopAppBar('ĐƠN HÀNG', FontAwesomeIcons.circleArrowLeft, null, null)),
    body: TabControllerWidget(indexPage: widget.indexPage),
  );
}