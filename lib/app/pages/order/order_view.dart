import 'package:co_tam_houseworker_mobile/app/widgets/information/icon_text_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/app_bar/top_app_bar.dart';
import '../../widgets/information/order_information/order_details_information_card.dart';
import '../../widgets/information/order_information/order_details_summary.dart';
import '../../widgets/information/person_information_card.dart';
import '../../widgets/state/order_status.dart';
import 'order_controller.dart';

class OrderPage extends View {
  const OrderPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderPageView();
}

class OrderPageView extends ViewState<OrderPage, OrderController> {
  OrderPageView() : super(OrderController());

  @override
  Widget get view => Scaffold(
    appBar: const PreferredSize(
        preferredSize: Size(VisualDensity.maximumDensity, 56),
        child: TopAppBar('Đơn hàng', null)
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        IconTextInformation(FontAwesomeIcons.locationDot, 'Phòng 2.03, S.201, Vinhomes Grand Park'),
        SizedBox(height: 12),
        OrderStatus(),
        SizedBox(height: 12),
        PersonInformationCard(),
        SizedBox(height: 12),
        OrderDetailsInformationCard(),
        SizedBox(height: 12),
        OrderDetailsSummary()
      ],
    ),
  );
}