import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class TabBody extends StatefulWidget {
  final View bodyView;
  const TabBody({Key? key, required this.bodyView}) : super(key: key);

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
      child: widget.bodyView
    );
  }
}