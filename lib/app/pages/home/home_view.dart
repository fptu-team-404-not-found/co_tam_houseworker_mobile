import 'dart:async';

import 'package:co_tam_houseworker_mobile/app/pages/order/order_popup.dart';
import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/button/square_box_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/button/switch_button.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/top_app_bar.dart';
import 'package:co_tam_houseworker_mobile/model/workerInOrder/worker_in_order.dart';
import 'package:co_tam_houseworker_mobile/repositories/worker_in_order_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/houseworker/houseworker.dart';
import '../../../repositories/auth_repository.dart';
import '../../../repositories/houseworker_repository.dart';
import '../../widgets/information/avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WorkerInOrder _workerInOrder;
  bool isPopup = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      _getPopup();
    });
  }

  void _getPopup() async {
    _workerInOrder = await WorkerInOrderRepository().getPopup();
    setState(() {
      isPopup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isPopup
        ? OrderPopupPage(workerInOrder: _workerInOrder)
        : Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(VisualDensity.maximumDensity, 56),
            child: TopAppBar("Xin chào", null, null, null)
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
                              padding: const EdgeInsets.only(right: 16.0, top: 8),
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
}