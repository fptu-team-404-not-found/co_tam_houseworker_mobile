import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/routes.dart';


class LoginButton extends StatelessWidget {
  final String title;
  final FaIcon icon;

  const LoginButton({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const VoidCallback? onPressed = null;
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, Routes.homePage);
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(300, 50)),
        backgroundColor: MaterialStateProperty.all(AppColor.primaryColor100),
        foregroundColor: MaterialStateProperty.all(AppColor.secondaryColor100),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )),
      ),
      label: Text(
        title
      ),
      icon: icon,
    );
  }
}
