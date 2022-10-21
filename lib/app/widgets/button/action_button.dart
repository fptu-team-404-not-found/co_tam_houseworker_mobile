import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final int numberOfButton;
  const ActionButton({Key? key, required this.numberOfButton}) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.numberOfButton <= 1) {
      return Material(
        color: AppColor.primaryColor100,
        child: InkWell(
          onTap: () {
            //print('called on tap');
          },
          child: const SizedBox(
            height: 56,
            width: double.infinity,
            child: Center(
              child: Text(
                'Làm việc',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondaryColor100,
                    fontSize: 24
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Row(
      children: [
        Material(
          color: AppColor.secondaryColor100,
          child: InkWell(
            onTap: () {
              //print('called on tap');
            },
            child: const SizedBox(
              height: 56,
              width: 165,
              child: Center(
                child: Text(
                  'Hủy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor100,
                    fontSize: 24
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Material(
            color: AppColor.primaryColor100,
            child: InkWell(
              onTap: () {
                //print('called on tap');
              },
              child: const SizedBox(
                height: 56,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Di chuyển',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondaryColor100,
                      fontSize: 24
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
