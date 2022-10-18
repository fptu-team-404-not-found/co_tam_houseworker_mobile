import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'order_details_summary_price.dart';

class OrderDetailsSummary extends StatefulWidget {
  const OrderDetailsSummary({Key? key}) : super(key: key);

  @override
  State<OrderDetailsSummary> createState() => _OrderDetailsSummaryState();
}

class _OrderDetailsSummaryState extends State<OrderDetailsSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Divider(color: AppColor.primaryColor100),
        Text('Tóm tắt dịch vụ', style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24
        )),
        Padding(padding: EdgeInsets.all(4), child: OrderDetailsSummaryPrice()),
        Padding(padding: EdgeInsets.all(4), child: OrderDetailsSummaryPrice())
      ],
    );
  }
}
