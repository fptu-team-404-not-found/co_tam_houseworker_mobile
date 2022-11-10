
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class HouseworkerInformationAva extends StatefulWidget {
  final String avatar;

  const HouseworkerInformationAva({Key? key, required this.avatar}) : super(key: key);

  @override
  State<HouseworkerInformationAva> createState() => _HouseworkerInformationAvaState();
}

class _HouseworkerInformationAvaState extends State<HouseworkerInformationAva> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primaryColor100, width: 4),
            ),
            child: ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(80.0)),
              child: Image.network(widget.avatar.toString()),
            ),
          ),
        ]
    );
  }
}
