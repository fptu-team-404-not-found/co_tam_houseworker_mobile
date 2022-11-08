import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class AccountInfoBar extends StatefulWidget {
  final String textData;
  final IconData iconData;

  const AccountInfoBar({Key? key, required this.textData, required this.iconData}) : super(key: key);

  @override
  State<AccountInfoBar> createState() => _AccountInfoBarState();
}

class _AccountInfoBarState extends State<AccountInfoBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(widget.iconData, size: 30, color: AppColor.primaryColor30),
            Text(widget.textData, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
