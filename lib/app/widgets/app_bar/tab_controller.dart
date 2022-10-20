import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/tab_body.dart';
import 'package:flutter/material.dart';

import '../../pages/order/order_receiving.dart';

class TabControllerWidget extends StatefulWidget {
  const TabControllerWidget({Key? key}) : super(key: key);

  @override
  _TabControllerWidgetState createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget>
    with SingleTickerProviderStateMixin {
  late final tabController =
  TabController(length: 3, vsync: this, initialIndex: 0);

  @override
  void initState() {
    super.initState();
    tabController.addListener(() {
      if (tabController.previousIndex != tabController.index && !tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  List<Padding> get _tabs {
    var list = [for (var i = 0; i < 3; i += 1) i];
    List<Padding> tabs = const [
      Padding(padding: EdgeInsets.all(8), child: Text('ĐANG NHẬN', style: TextStyle(
        fontSize: 16
      ))),
      Padding(padding: EdgeInsets.all(8), child: Text('ĐÁNH GIÁ', style: TextStyle(
        fontSize: 16
      ))),
      Padding(padding: EdgeInsets.all(8), child: Text('LỊCH SỬ', style: TextStyle(
        fontSize: 16
      ))),
    ];
    return tabs;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 48,
          color: AppColor.secondaryColor100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBar(
                  isScrollable: true,
                  tabs: _tabs,
                  controller: tabController,
                  unselectedLabelColor: AppColor.subColor100,
                  labelColor: AppColor.primaryColor100,
                  indicatorWeight: 2,
                  indicatorColor: AppColor.primaryColor30
              )
            ]
          )
        ),
        TabBody(bodyView: OrderReceivingPage())
      ],
    );
  }
}

