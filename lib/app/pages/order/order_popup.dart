import 'package:co_tam_houseworker_mobile/app/utils/constant.dart';
import 'package:co_tam_houseworker_mobile/app/widgets/button/action_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/information/icon_text_information.dart';

class OrderPopupPage extends StatefulWidget {
  const OrderPopupPage({Key? key}) : super(key: key);

  @override
  State<OrderPopupPage> createState() => _OrderPopupPageState();
}

class _OrderPopupPageState extends State<OrderPopupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0x00000000),
          actions: [
            SizedBox(
              height: 30.0,
              width: 30.0,
              child: FittedBox(
                child: Align(
                    alignment: Alignment.topRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        //Navigator.pop(context);
                      },
                      backgroundColor: Colors.transparent,
                      shape: const StadiumBorder(
                          side: BorderSide(
                            color: AppColor.secondaryColor100,
                            width: 2,
                          )
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.xmark,
                        color: AppColor.secondaryColor100,
                      ),
                    )
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 24)),
          ],
        )
      ),
      body: Align(
        alignment: const Alignment(0, -0.5),
        child: SizedBox(
          width: 320,
          height: 500,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 500,
                width: 320,
                color: AppColor.secondaryColor100,
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2), // Border width
                            decoration: const BoxDecoration(color: AppColor.primaryColor100, shape: BoxShape.circle),
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(32), // Image radius
                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgZr2bRYws3mZATSfD9IG7Qu-zT2__mhzsZA&usqp=CAU', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Tên dịch vụ dọn dẹp ví dụ tên bị dài',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryColor100
                                ),
                              ),
                            )
                          )
                        ],
                      )
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                            'Thành tiền',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                color: AppColor.subColor100
                            )
                        ),
                        Text(
                            '78.000đ',
                            style: AppText.headingSmall
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 8,
                    thickness: 1,
                    indent: 18,
                    endIndent: 18,
                    color: AppColor.subColor10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 90,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColor.primaryColor30,
                              ),
                              child: const Text('Ví Cô Tấm', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                            )
                        ),
                        InkWell(
                            onTap: () {
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 90,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColor.primaryColor30,
                              ),
                              child: const Text('Khuyến mãi', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                            )
                        ),
                        InkWell(
                            onTap: () {
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 90,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColor.primaryColor30,
                              ),
                              child: const Text('Phí dịch vụ', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                            )
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 8,
                    thickness: 1,
                    indent: 18,
                    endIndent: 18,
                    color: AppColor.subColor10,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 300,
                      padding: const EdgeInsets.all(12),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: const [
                          IconTextInformation(FontAwesomeIcons.clock, informationDetails: '1h'),
                          IconTextInformation(FontAwesomeIcons.handHoldingHeart, informationDetails: 'Dọn dẹp nhà cửa'),
                          IconTextInformation(null, informationDetails: 'Ủi đồ'),
                          IconTextInformation(null, informationDetails: 'Vệ sinh khu vật nuôi'),
                          IconTextInformation(FontAwesomeIcons.calendar, informationDetails: 'Ghi chú'),
                        ],
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const ActionButton(numberOfButton: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}
