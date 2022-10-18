import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/information/avatar.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/information/icon_text_information.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetailsInformationCard extends StatefulWidget {
  const OrderDetailsInformationCard({Key? key}) : super(key: key);

  @override
  State<OrderDetailsInformationCard> createState() => _OrderDetailsInformationCardState();
}

class _OrderDetailsInformationCardState extends State<OrderDetailsInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 350,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: AppColor.primaryColor50,
          width: 1,
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: const [
          IconTextInformation(FontAwesomeIcons.clock, '1 giờ'),
          IconTextInformation(FontAwesomeIcons.handHoldingHeart, 'Dọn dẹp nhà cửa'),
          IconTextInformation(null, 'Ủi đồ'),
          IconTextInformation(null, 'Vệ sinh khu vật nuôi'),
          IconTextInformation(FontAwesomeIcons.calendar, 'Ghi chú'),
        ],
      )
    );
  }
}
