import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HouseworkerInformationPage extends StatelessWidget {
  const HouseworkerInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: TopAppBar('Thông tin cá nhân', FontAwesomeIcons.circleArrowLeft, null, null),
      ),
      body: Center(
        child: Text(
          'Hello Bà Tiên'
        ),
      ),
    );
  }
}
