import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/information/avatar.dart';
import 'package:co_tam_houseworker_mobile/model/customer/customer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonInformationCard extends StatefulWidget {
  final Customer? customer;
  const PersonInformationCard({Key? key, this.customer}) : super(key: key);

  @override
  State<PersonInformationCard> createState() => _PersonInformationCardState();
}

class _PersonInformationCardState extends State<PersonInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 350,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: AppColor.primaryColor50,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: AppColor.primaryColor100,
            child: Padding(
              padding: const EdgeInsets.all(0.5), // Border radius
              child: ClipOval(child: Container(
                padding: const EdgeInsets.all(2), // Border width
                decoration: const BoxDecoration(color: AppColor.primaryColor100, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.infinite, // Image radius
                    child: Image.network(widget.customer!.avatar.toString(), fit: BoxFit.cover),
                  ),
                ),
              ),),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(4), child: Text(widget.customer!.name.toString(), style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor100
              ))),
              Padding(padding: const EdgeInsets.all(4), child: Text(widget.customer!.phone!.toString(), style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.subColor100
              ))),
            ],
          ),
          //const FaIcon(FontAwesomeIcons.phone, color: AppColor.primaryColor100)
        ],
      )
    );
  }
}
