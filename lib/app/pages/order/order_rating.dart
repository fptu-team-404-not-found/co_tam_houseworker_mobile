import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'order_controller.dart';

class OrderRatingPage extends View {
  const OrderRatingPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderRatingPageView();
}

class OrderRatingPageView extends ViewState<OrderRatingPage, OrderController> {
  OrderRatingPageView() : super(OrderController());

  @override
  Widget get view => Container(
    child: Text('Rating'),
  );
}