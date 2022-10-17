import 'package:co_tam_houseworker_mobile/app/pages/home/home_controller.dart';
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
  Widget get view => const Scaffold(
    appBar: PreferredSize(
        preferredSize: Size(VisualDensity.maximumDensity, 56),
        child: TopAppBar("Xin chào", null)
    ),
    body: SwitchButton(),
  );

}