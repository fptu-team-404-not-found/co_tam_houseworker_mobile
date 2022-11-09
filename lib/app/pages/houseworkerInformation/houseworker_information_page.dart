import 'dart:async';

import 'package:co_tam_houseworker_mobile/app/pages/houseworkerInformation/houseworker_information_update_page.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/top_app_bar.dart';

import 'package:co_tam_houseworker_mobile/app/widgets/information/houseworker_information/houseworker_infor_ava_name.dart';
import 'package:co_tam_houseworker_mobile/model/houseworker/houseworker.dart';
import 'package:co_tam_houseworker_mobile/repositories/area_repository.dart';

import 'package:co_tam_houseworker_mobile/repositories/houseworker_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/area/area.dart';
import '../../utils/constant.dart';
import '../../utils/routes.dart';
import '../../widgets/information/houseworker_information/account_info_bar.dart';
import '../../widgets/information/houseworker_information/houseworker_infor_button_bar.dart';
import '../login/login_page.dart';



class HouseworkerInformationPage extends StatefulWidget {
  const HouseworkerInformationPage({Key? key}) : super(key: key);

  @override
  State<HouseworkerInformationPage> createState() =>
      _HouseworkerInformationPageState();
}

class _HouseworkerInformationPageState extends State<HouseworkerInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: TopAppBar('Thông tin cá nhân', FontAwesomeIcons.circleArrowLeft, null, null),
      ),
      body: FutureBuilder<Houseworker>(
              future: fetchHouseworkerById(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      children: const [
                        SizedBox(height: 40),
                        CircularProgressIndicator(),
                      ],
                    )
                  );
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      HouseworkerInformationAvaName(avatar: snapshot.data!.data!.avatar, name: snapshot.data!.data!.name),
                      const SizedBox(height: 20,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      AccountInfoBar(textData: snapshot.data!.data!.phone == null ? '' : snapshot.data!.data!.phone.toString(), iconData: Icons.phone,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      AccountInfoBar(textData: snapshot.data!.data!.email == null ? '' : snapshot.data!.data!.email.toString(), iconData: Icons.mail,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      Container(child:
                        FutureBuilder<Area> (future: fetchAreaById(snapshot.data!.data!.areaId),
                            builder: (context1, snapshot1) {
                              if (snapshot1.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (snapshot1.hasData) {
                                return AccountInfoBar(textData: snapshot1.data!.data!.name, iconData: FontAwesomeIcons.building,);
                              } else {
                                return AccountInfoBar(textData: 'hihi', iconData: FontAwesomeIcons.building,);
                              }
                            }
                        ),
                      ),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      const SizedBox(height: 20,),
                      /*const HouseworkerInforButtonBar(),*/


                      //Xin lui ba Tien vi su do hem nay
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                navigateSecondPage();
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
                                GoogleSignIn _googleSignIn = GoogleSignIn();
                                try {
                                  var result = await _googleSignIn.signOut();
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
                      )
                    ],
                  );
                }
                return const Center(child: Text('Lỗi'));
              }
          ),
      );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => HouseworkerInformationUpdatePage());
    Navigator.push(context, route).then(onGoBack);
  }
}

