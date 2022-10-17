import 'package:co_tam_houseworker_mobile/app/pages/home/home_controller.dart';
import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/avatar.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/switch_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageView();
}

class HomePageView extends ViewState<HomePage, HomeController> {
  HomePageView() : super(HomeController());

  @override
  // TODO: implement view
  Widget get view => Scaffold(
    appBar: const PreferredSize(
        preferredSize: Size(VisualDensity.maximumDensity, 56),
        child: TopAppBar("Xin chào", null)
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        const Divider(),
        const Avatar(radius: 80)
      ],
    ),
  );

}