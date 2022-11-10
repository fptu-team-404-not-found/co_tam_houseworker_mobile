import 'package:co_tam_houseworker_mobile/app/pages/home/home_controller.dart';
import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/button/square_box_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/button/switch_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/houseworker/houseworker.dart';
import '../../../repositories/auth_repository.dart';
import '../../../repositories/houseworker_repository.dart';
import '../../utils/routes.dart';
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
    appBar: PreferredSize(
        preferredSize: const Size(VisualDensity.maximumDensity, 56),
        child: TopAppBar("Xin chào", null, FontAwesomeIcons.bell, () => {Navigator.pushNamed(context, Routes.notificationPage)})
    ),
    body: FutureBuilder<Houseworker>(
      future: fetchHouseworkerById(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
                  color: AppColor.secondaryColor100,
                  backgroundColor: AppColor.primaryColor100,
                  strokeWidth: 2.0
              )
          );
        }
        if (snapshot.hasData) {
          return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 8),
                          child: Text(
                            'Chế độ nhận đơn',
                            style: AppText.headingSmall,
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 16.0, top: 8),
                          child: SwitchButton(id: snapshot.data?.id),
                      )
                    ],
                  ),
                  const Divider(thickness: 3),
                  const SizedBox(height: 32),

                  FutureBuilder<String?>(
                      future: getUrlImage(),
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
                          return Avatar(imgUrl: snapshot.data.toString(), radius: 120);
                        }
                        return const Center(child: Text('Lỗi'));
                      }
                  ),

                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SquareBoxButton(text: 'Đang thực hiện', iconData: FontAwesomeIcons.list, subNumber: 0, isLight: true),
                      SquareBoxButton(text: 'Đã hoàn thành', iconData: FontAwesomeIcons.listCheck, subNumber: 2, isLight: false)
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Divider(color: AppColor.primaryColor100, thickness: 3),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text('ĐƠN HIỆN TẠI', style: AppText.headingLarge),
                      SizedBox(height: 12),
                      Text('Hiện tại không có đơn nào', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ))
                    ],
                  )
                ],
              )
          );
        }
        return const Center(child: Text('Lỗi'));
      }
    )
  );
}