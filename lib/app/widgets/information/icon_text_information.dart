import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconTextInformation extends StatefulWidget {
  final String informationDetails;
  final IconData icon;

  const IconTextInformation(
      {required this.informationDetails, required this.icon, Key? key})
      : super(key: key);

  @override
  State<IconTextInformation> createState() => _IconTextInformationState();
}

class _IconTextInformationState extends State<IconTextInformation> {
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
