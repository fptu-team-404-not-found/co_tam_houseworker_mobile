import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetailsInformation extends StatefulWidget {
  final String informationDetails;
  final IconData icon;

  const OrderDetailsInformation(
      {required this.informationDetails, required this.icon, Key? key})
      : super(key: key);

  @override
  State<OrderDetailsInformation> createState() => _OrderDetailsInformationState();
}

class _OrderDetailsInformationState extends State<OrderDetailsInformation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.all(8), child: FaIcon(widget.icon, color: AppColor.primaryColor100)),
        Text(widget.informationDetails, style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontStyle: FontStyle.normal,
          color: AppColor.subColor100)
        )
      ],
    );
  }
}
