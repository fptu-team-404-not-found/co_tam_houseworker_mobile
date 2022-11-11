import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderStatus extends StatefulWidget {
  final int status;
  const OrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.calendarCheck,
                color: widget.status == 2 ? AppColor.primaryColor100 : AppColor.primaryColor30),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(height: 3.0, width: 50.0, color: AppColor.subColor30)),
            FaIcon(FontAwesomeIcons.calendarCheck,
                color: widget.status == 3 ? AppColor.primaryColor100 : AppColor.primaryColor30),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(height: 3.0, width: 50.0, color: AppColor.subColor30)),
            FaIcon(FontAwesomeIcons.calendarCheck,
                color: widget.status == 4 ? AppColor.primaryColor100 : AppColor.primaryColor30),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(height: 3.0, width: 50.0, color: AppColor.subColor30)),
            FaIcon(FontAwesomeIcons.calendarCheck,
                color: (widget.status == 5 || widget.status == 6) ? AppColor.primaryColor100 : AppColor.primaryColor30),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Padding(padding: EdgeInsets.all(4), child: Text('Nhận đơn')),
            Padding(padding: EdgeInsets.all(4), child: Text('Di chuyển')),
            Padding(padding: EdgeInsets.all(4), child: Text('Làm việc')),
            Padding(padding: EdgeInsets.all(4), child: Text('Hoàn thành'))
          ],
        )
      ],
    );
  }
}
