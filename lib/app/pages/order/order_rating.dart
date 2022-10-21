import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/information/order_information/order_information_tag.dart';
import 'order_controller.dart';

class OrderRatingPage extends View {
  const OrderRatingPage({super.key});

  @override
  State<StatefulWidget> createState() => OrderRatingPageView();
}

class OrderRatingPageView extends ViewState<OrderRatingPage, OrderController> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  OrderRatingPageView() : super(OrderController());

  @override
  Widget get view => Scaffold(
    body: RefreshIndicator(
      key: _refreshIndicatorKey,
      color: Colors.white,
      backgroundColor: AppColor.primaryColor100,
      strokeWidth: 2.0,
      onRefresh: () async {
        // Replace this delay with the code to be executed during refresh
        // and return a Future when code finishs execution.
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      // Pull from top to show refresh indicator.
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return const OrderInformationTag(iconData: FontAwesomeIcons.addressCard, mainInfo: 'Dọn dẹp vệ sinh nhà cửa', subInfo: '21-10-2022', extraInfo: 'Đánh giá 5 sao');
        },
      ),
    ),
  );
}
