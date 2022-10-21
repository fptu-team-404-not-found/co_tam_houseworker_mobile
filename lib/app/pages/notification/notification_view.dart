import 'package:co_tam_houseworker_mobile/app/pages/notification/notification_controller.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/information/order_information/order_information_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/app_bar/top_app_bar.dart';

class NotificationPage extends View {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => NotificationPageView();
}

class NotificationPageView extends ViewState<NotificationPage, NotificationController> {
  NotificationPageView() : super(NotificationController());

  @override
  Widget get view => const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56), child: TopAppBar('THÔNG BÁO', FontAwesomeIcons.circleArrowLeft, null, null)),
      body: OrderInformationTag(iconData: FontAwesomeIcons.info, mainInfo: 'Dọn dẹp vệ sinh nhà cửa', subInfo: 'Xác nhận đơn thành công', extraInfo: '21-10-2022')
  );
}