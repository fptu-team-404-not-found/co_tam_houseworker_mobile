

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../pages/login/login_page.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes.dart';

class HouseworkerInforButtonBar extends StatelessWidget {
  const HouseworkerInforButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.houseworkerInformationUpdatePage);
            },
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: AppColor.primaryColor30,
              ),
              child: const Text('Cập nhật', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
            )
        ),
        InkWell(
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              try {
                await googleSignIn.signOut();
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('accessToken');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()), (
                    route) => false);
              } catch (error) {
                print(error);
              }
            },

            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: AppColor.primaryColor30,
              ),
              child: const Text('Đăng xuất', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
            )
        ),
      ],
    );
  }
}