import 'package:flutter/material.dart';

class OrderDetailsSummaryPrice extends StatefulWidget {
  const OrderDetailsSummaryPrice({Key? key}) : super(key: key);

  @override
  State<OrderDetailsSummaryPrice> createState() => _OrderDetailsSummaryPriceState();
}

class _OrderDetailsSummaryPriceState extends State<OrderDetailsSummaryPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('Dịch vụ chính', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400
        )),
        Text('220.000đ', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400
        ))
      ],
    );
  }
}
