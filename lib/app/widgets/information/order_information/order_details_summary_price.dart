import 'package:co_tam_houseworker_mobile/model/order/order.dart';
import 'package:flutter/material.dart';

class OrderDetailsSummaryPrice extends StatefulWidget {
  final Order order;
  const OrderDetailsSummaryPrice({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderDetailsSummaryPrice> createState() => _OrderDetailsSummaryPriceState();
}

class _OrderDetailsSummaryPriceState extends State<OrderDetailsSummaryPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Dịch vụ chính', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400
        )),
        Text(widget.order.total.toString(), style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400
        ))
      ],
    );
  }
}
