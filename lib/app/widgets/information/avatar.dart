import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/utils/routes.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imgUrl;
  final double radius;

  const Avatar(
      {Key? key,
      this.imgUrl = 'assets/img/default_avatar.jpg',
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.houseworkerInformationPage);
      },
      child: CircleAvatar(
        radius: radius,
        backgroundColor: AppColor.primaryColor100,
        child: Padding(
          padding: const EdgeInsets.all(4), // Border radius
          child: ClipOval(child: Container(
            padding: EdgeInsets.all(2), // Border width
            decoration: BoxDecoration(color: AppColor.primaryColor100, shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.infinite, // Image radius
                child: Image.network(imgUrl, fit: BoxFit.cover),
              ),
            ),
          ),),
        ),
      ),
    );
  }
}
