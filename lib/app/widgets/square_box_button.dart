import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/material.dart';

class SquareBoxButton extends StatelessWidget {
  const SquareBoxButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(18.0),
        //         side: BorderSide(color: Colors.red)
        //     )
        // ),
        fixedSize: MaterialStateProperty.all(Size.square(180)),
        backgroundColor: MaterialStateProperty.all(AppColor.secondaryColor100)
      ),
      onPressed: () {},
      child: const Text(
        'hi',
        style: TextStyle(
          color: AppColor.primaryColor100
        ),
      ),
    );
  }
}
