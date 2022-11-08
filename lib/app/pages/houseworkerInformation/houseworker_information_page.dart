import 'package:co_tam_houseworker_mobile/app/widgets/app_bar/top_app_bar.dart';
import 'package:co_tam_houseworker_mobile/model/houseworker.dart';
import 'package:co_tam_houseworker_mobile/repositories/houseworker_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              future: fetchHouseworkerById(1),
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
                      Text(snapshot.data!.data!.name),
                      Text(snapshot.data!.data!.phone!),
                      Text(snapshot.data!.data!.email),
                    ],
                  );
                }
                return const Center(child: Text('Lỗi'));
              }
          ),
      );
  }
}
