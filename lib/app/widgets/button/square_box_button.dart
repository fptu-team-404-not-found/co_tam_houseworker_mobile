import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquareBoxButton extends StatefulWidget {
  final String text;
  final IconData iconData;
  final int subNumber;
  final bool isLight;

  const SquareBoxButton(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.subNumber,
      required this.isLight})
      : super(key: key);

  @override
  State<SquareBoxButton> createState() => _SquareBoxButtonState();
}

class _SquareBoxButtonState extends State<SquareBoxButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size.square(180)),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (widget.isLight) {
              return AppColor.secondaryColor100;
            }
            return AppColor.primaryColor100;
          })),
      onPressed: () {
        Navigator.pushNamed(context, Routes.orderPage);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(widget.iconData, color: (widget.isLight) ? AppColor.primaryColor100 : AppColor.secondaryColor100),
          Text(
            widget.text,
            style: TextStyle(color: (widget.isLight) ? AppColor.primaryColor100 : AppColor.secondaryColor100),
          ),
        ],
      ),
    );
  }
}
