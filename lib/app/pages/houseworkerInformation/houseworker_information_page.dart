import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/top_app_bar.dart';
import 'package:co_tam_houseworker_mobile/model/houseworker.dart';
import 'package:co_tam_houseworker_mobile/repositories/houseworker_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constant.dart';
import '../../widgets/information/houseworker_information/account_info_bar.dart';
import '../../widgets/information/houseworker_information/houseworker_infor_button_bar.dart';

class HouseworkerInformationPage extends StatelessWidget {
  const HouseworkerInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: TopAppBar('Thông tin cá nhân', FontAwesomeIcons.circleArrowLeft, null, null),
      ),
      body: FutureBuilder<Houseworker>(
              future: fetchHouseworkerById(),
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
                  return Column(
                    children: [
                      const SizedBox(height: 40,),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColor.primaryColor100, width: 4),
                        ),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(80.0)),
                          child: Image.network(snapshot.data!.data!.avatar == null ? 'https://i.pinimg.com/originals/5f/39/e6/5f39e6d606da1c3d603bdabfccf053f3.jpg' : snapshot.data!.data!.avatar!.toString().toString()),
                        ),
                      ),
                      Text(
                        snapshot.data!.data!.name.toString(),
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      AccountInfoBar(textData: snapshot.data!.data!.phone == null ? '' : snapshot.data!.data!.phone.toString(), iconData: Icons.phone,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      AccountInfoBar(textData: snapshot.data!.data!.email == null ? '' : snapshot.data!.data!.email.toString(), iconData: Icons.mail,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      AccountInfoBar(textData: snapshot.data!.data!.areaId == null ? '' : snapshot.data!.data!.areaId.toString(), iconData: FontAwesomeIcons.building,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      AccountInfoBar(textData: snapshot.data!.data!.managerId == null ? '' : snapshot.data!.data!.managerId.toString(), iconData: FontAwesomeIcons.userTie,),
                      const Divider(
                        height: 8,
                        thickness: 1,
                        color: AppColor.subColor30,
                      ),
                      const SizedBox(height: 20,),
                      const HouseworkerInforButtonBar()
                    ],
                  );
                }
                return const Center(child: Text('Lỗi'));
              }
          ),
      );
  }
}
