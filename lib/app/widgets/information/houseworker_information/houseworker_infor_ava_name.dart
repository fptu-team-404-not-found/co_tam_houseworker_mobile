
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class HouseworkerInformationAvaName extends StatefulWidget {
  const HouseworkerInformationAvaName({Key? key, required this.avatar, required this.name}) : super(key: key);
  final avatar, name;

  @override
  State<HouseworkerInformationAvaName> createState() => _HouseworkerInformationAvaNameState();
}

class _HouseworkerInformationAvaNameState extends State<HouseworkerInformationAvaName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const SizedBox(height: 40,),
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
        Text(
          widget.name ,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ]
    );
  }
}
