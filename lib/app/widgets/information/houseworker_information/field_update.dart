import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class FieldUpdate extends StatefulWidget {
  const FieldUpdate({Key? key,required this.title, required this.conroller,required this.hintText}) : super(key: key);
  final title, hintText;
  final conroller;

  @override
  State<FieldUpdate> createState() => _FieldUpdateState();
}

class _FieldUpdateState extends State<FieldUpdate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            alignment: Alignment.bottomLeft,
            child: Text(widget.title, style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),textAlign: TextAlign.start,)
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: AppColor.primaryColor30,
            ),
          ),
          child: TextField(
            cursorColor: Colors.black,
            style: const TextStyle(
                fontSize: 20, color: Colors.black),
            controller: widget.conroller,
            decoration: InputDecoration(
              border: const  OutlineInputBorder(borderSide: BorderSide.none),
              hintText: widget.hintText,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
