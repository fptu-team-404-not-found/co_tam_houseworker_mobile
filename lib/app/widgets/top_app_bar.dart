import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  final String title;
  final Icon? leadingICon;

  const TopAppBar(this.title, this.leadingICon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingICon,
        title: Center(
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  fontStyle: FontStyle.normal,
                  color: AppColor.secondaryColor100
                ))),
        backgroundColor: AppColor.primaryColor100,
      )
    );
  }
}
