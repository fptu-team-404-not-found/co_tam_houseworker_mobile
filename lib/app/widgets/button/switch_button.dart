import 'package:co_tam_houseworker_mobile/model/houseworker/houseworker.dart';
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
    return FutureBuilder<Houseworker> (future: fetchHouseworkerById(),
        builder: (context1, snapshot1) {
          if (snapshot1.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: AppColor.secondaryColor100,
              backgroundColor: AppColor.primaryColor100,
              strokeWidth: 2.0,
            );
          }
          if (snapshot1.hasData) {
            if (snapshot1.data!.active == 1) {
              isSwitched = true;
            }
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
           return const Text("Lỗi");
        }
    );
  }
}
