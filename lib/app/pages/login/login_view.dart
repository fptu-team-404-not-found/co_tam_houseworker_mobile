import 'package:co_tam_houseworker_mobile/app/widgets/login_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/top_app_bar.dart';
import 'package:flutter/cupertino.dart';
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
  Widget get view => Stack(
    children: [
      const TopAppBar('Cô Tấm', null),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Image(image: AssetImage('assets/img/login_img.png')),
          LoginButton(title: 'Đăng nhập với Google', icon: FaIcon(FontAwesomeIcons.google)),
          LoginButton(title: 'Đăng nhập với Facebook', icon: FaIcon(FontAwesomeIcons.facebook))
        ],
      )
    ],
  );
}