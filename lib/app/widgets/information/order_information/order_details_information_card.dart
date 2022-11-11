import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/information/icon_text_information.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../model/order/order.dart';

class OrderDetailsInformationCard extends StatefulWidget {
  final Order order;
  const OrderDetailsInformationCard({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderDetailsInformationCard> createState() => _OrderDetailsInformationCardState();
}

class _OrderDetailsInformationCardState extends State<OrderDetailsInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 350,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: AppColor.primaryColor50,
          width: 1,
        ),
      ),
      child: Wrap(
        direction: Axis.vertical,
        children: [
          IconTextInformation(FontAwesomeIcons.clock, informationDetails: widget.order.package!.name.toString()),
          IconTextInformation(FontAwesomeIcons.handHoldingHeart, informationDetails: widget.order.package!.service!.name.toString()),
          //const IconTextInformation(null, informationDetails: 'Ủi đồ'),
          //IconTextInformation(null, informationDetails: 'Vệ sinh khu vật nuôi'),
          const IconTextInformation(FontAwesomeIcons.calendar, informationDetails: 'Ghi chú')
        ],
      )
    );
  }
}
