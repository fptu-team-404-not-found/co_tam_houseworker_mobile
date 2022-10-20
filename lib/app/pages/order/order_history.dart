import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'order_controller.dart';

class OrderHistoryPage extends View {
  const OrderHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderHistoryPageView();
}

class OrderHistoryPageView extends ViewState<OrderHistoryPage, OrderController> {
  OrderHistoryPageView() : super(OrderController());

  @override
  Widget get view => Container(
    child: Text('History'),
  );
}