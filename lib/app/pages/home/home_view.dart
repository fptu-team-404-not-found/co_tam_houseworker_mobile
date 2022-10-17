import 'package:co_tam_houseworker_mobile/app/pages/home/home_controller.dart';
import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/button/square_box_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/button/switch_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/information/avatar.dart';

class HomePage extends View {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageView();
}

class HomePageView extends ViewState<HomePage, HomeController> {
  HomePageView() : super(HomeController());

  @override
  Widget get view => Scaffold(
    appBar: const PreferredSize(
        preferredSize: Size(VisualDensity.maximumDensity, 56),
        child: TopAppBar("Xin chào", null)
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                'Chế độ nhận đơn',
                style: AppText.headingSmall,
              )
            ),
            Padding(
                padding: EdgeInsets.only(right: 16.0, top: 8),
                child: SwitchButton()
            )
          ],
        ),
        const Divider(thickness: 3),
        const SizedBox(height: 48),
        const Avatar(radius: 80),
        const SizedBox(height: 48),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SquareBoxButton(text: 'Đang thực hiện', iconData: FontAwesomeIcons.list, subNumber: 1, isLight: true),
            SquareBoxButton(text: 'Đã hoàn thành', iconData: FontAwesomeIcons.listCheck, subNumber: 1, isLight: false)
          ],
        ),
        const SizedBox(height: 48),
        const Divider(color: AppColor.primaryColor100, thickness: 3),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Text('ĐƠN HIỆN TẠI', style: AppText.headingLarge),
            SizedBox(height: 12),
            Text('Hiện tại không có đơn nào', style: AppText.textBlack)
          ],
        )
      ],
    ),
  );

}