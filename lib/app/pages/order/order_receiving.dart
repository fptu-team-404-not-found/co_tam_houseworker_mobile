import 'package:co_tam_houseworker_mobile/app/widgets/button/action_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/information/icon_text_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/information/order_information/order_details_information_card.dart';
import '../../widgets/information/order_information/order_details_summary.dart';
import '../../widgets/information/person_information_card.dart';
import '../../widgets/state/order_status.dart';
import 'order_controller.dart';

class OrderReceivingPage extends View {
  const OrderReceivingPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderReceivedPageView();
}

class OrderReceivedPageView
    extends ViewState<OrderReceivingPage, OrderController> {
  OrderReceivedPageView() : super(OrderController());

  @override
  Widget get view => Scaffold(
    body: SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(height: 12),
            IconTextInformation(FontAwesomeIcons.locationDot, informationDetails: 'Phòng 2.03, S.201, Vinhomes Grand Park'),
            SizedBox(height: 12),
            OrderStatus(),
            SizedBox(height: 12),
            PersonInformationCard(),
            SizedBox(height: 12),
            OrderDetailsInformationCard(),
            SizedBox(height: 12),
            OrderDetailsSummary(),
            SizedBox(height: 68)
          ]
      ),
    ),
    floatingActionButton: const ActionButton(numberOfButton: 2),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}
