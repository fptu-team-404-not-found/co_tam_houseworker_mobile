import 'package:flutter/material.dart';

import '../../../repositories/houseworker_repository.dart';
import '../../utils/constant.dart';

class SwitchButton extends StatefulWidget {
  final int? id;

  const SwitchButton({Key? key, this.id = 0}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            updateUserStatus(widget.id, context);
          });
        },
        activeTrackColor: AppColor.primaryColor100,
        activeColor: AppColor.primaryColor50,
      )
    );
  }
}
