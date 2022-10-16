import 'package:co_tam_houseworker_mobile/app/widgets/login_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_controller.dart';

class LoginPage extends View {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageView();
}

class LoginPageView extends ViewState<LoginPage, LoginController> {
  LoginPageView() : super(LoginController());

  @override
  Widget get view => Scaffold(
    appBar: const PreferredSize(
        preferredSize: Size(VisualDensity.maximumDensity, 56),
        child: TopAppBar('Cô Tấm', null)
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Center(child: Image(image: AssetImage('assets/img/login_img.png'))),
        SizedBox(height: 10),
        LoginButton(title: 'Đăng nhập với Google', icon: FaIcon(FontAwesomeIcons.google)),
        SizedBox(height: 10),
        LoginButton(title: 'Đăng nhập với Facebook', icon: FaIcon(FontAwesomeIcons.facebook))
      ],
    ),
  );
}