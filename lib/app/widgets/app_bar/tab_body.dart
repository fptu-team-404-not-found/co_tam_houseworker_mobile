import 'package:flutter/material.dart';

class TabBody extends StatefulWidget {
  final Widget bodyPage;
  const TabBody({Key? key, required this.bodyPage}) : super(key: key);

  @override
  State<TabBody> createState() => _TabBodyState();
}

class _TabBodyState extends State<TabBody> {
  @override
  void initState() {
    super.initState();
  }

  getDataForTab() {
    //getting data for widget.tabNumber
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.bodyPage
    );
  }
}