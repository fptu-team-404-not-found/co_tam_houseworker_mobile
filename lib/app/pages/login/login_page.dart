import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/token/token.dart';
import '../../../repositories/auth_repository.dart';
import '../../utils/routes.dart';
import '../../widgets/app_bar/top_app_bar.dart';
import '../../widgets/button/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignedIn = false;

  @override
  void initState() {
    checkSignInStatus();
    super.initState();
  }

  void checkSignInStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    GoogleSignIn googleSignIn = GoogleSignIn();
    isSignedIn = await googleSignIn.isSignedIn();
    if (!mounted) return;
    if (isSignedIn) {
      Navigator.pushReplacementNamed(context, Routes.homePage);
    }
  }

  void googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      if (result != null) {
        Token token = await authLogin(result.email);
        if (token.data == null) {
          googleSignIn.signOut();
          if (!mounted) return;
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("You are not allowed to access this application!")));
        }
        final prefs = await SharedPreferences.getInstance();
        // set value
        await prefs.setString("accessToken", token.data!.accessToken.toString());
        await prefs.setString("googleImgUrl", result.photoUrl.toString());

        if (!mounted) return;
        Navigator.pushNamed(context, Routes.homePage);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(VisualDensity.maximumDensity, 56),
            child: TopAppBar('Cô Tấm', null, null, null)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/img/login_img.png'),
                width: 500
              )
            ),
            const SizedBox(height: 20),
            LoginButton(
              title: 'Đăng nhập với Google',
              icon: const FaIcon(FontAwesomeIcons.google),
              customFunction: googleLogin
            ),
            const SizedBox(height: 20),
            const LoginButton(
              title: 'Đăng nhập với Facebook',
              icon: FaIcon(FontAwesomeIcons.facebook)
            )
          ],
        )
    );
  }
}