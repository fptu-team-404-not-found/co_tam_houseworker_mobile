import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/houseworker/houseworker.dart';
import '../../../repositories/auth_repository.dart';
import '../../../repositories/houseworker_repository.dart';
import '../../utils/constant.dart';
import '../../widgets/app_bar/top_app_bar.dart';
import '../../widgets/information/houseworker_information/field_update.dart';
import '../../widgets/information/houseworker_information/houseworker_infor_ava.dart';

class HouseworkerInformationUpdatePage extends StatefulWidget {
  const HouseworkerInformationUpdatePage({Key? key, this.name, this.phone, this.avatar}) : super(key: key);
  final name, phone, avatar;

  @override
  State<HouseworkerInformationUpdatePage> createState() => _UpdateInfoState(name, phone, avatar);
}

class _UpdateInfoState extends State<HouseworkerInformationUpdatePage> {
  String? name, phone, avatar;

  _UpdateInfoState(this.name, this.phone, this.avatar);
  static TextEditingController _nameController = TextEditingController();
  static TextEditingController _phoneNController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController(text: name.toString());
    _phoneNController = TextEditingController(text: '$phone');
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: TopAppBar('Cập nhật thông tin', FontAwesomeIcons.circleArrowLeft, null, null),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Houseworker>(
            future: fetchHouseworkerById(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  heightFactor: VisualDensity.maximumDensity,
                  child: CircularProgressIndicator(
                      color: AppColor.secondaryColor100,
                      backgroundColor: AppColor.primaryColor100,
                      strokeWidth: 2.0
                  )
                );
              }
              if (snapshot.hasData) {
                _nameController = TextEditingController(text: snapshot.data!.name);
                _phoneNController = TextEditingController(text: snapshot.data!.phone);
                return Column(
                  children: [
                    const SizedBox(height: 40,),
                    FutureBuilder<String?>(
                        future: getUrlImage(),
                        builder: (context, snapshot2) {
                          if (snapshot2.connectionState == ConnectionState.waiting) {
                            return Center(
                                child: Column(
                                  children: const [
                                    SizedBox(height: 40),
                                    CircularProgressIndicator(),
                                  ],
                                )
                            );
                          }
                          if (snapshot2.hasData) {
                            return HouseworkerInformationAva(avatar: snapshot2.data == null ? 'https://danhgiatot.cdn.vccloud.vn/wp-content/uploads/2022/10/meme-meo-cuoi-min.jpg' : snapshot2.data.toString());
                          }
                          return const Center(child: Text('Lỗi'));
                        }
                    ),
                    FieldUpdate(title: "Họ và tên", conroller: _nameController, hintText: name,),
                    FieldUpdate(title: "Điện thoại", conroller: _phoneNController, hintText: phone,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 30,
                          margin: const EdgeInsets.fromLTRB(0, 20, 25, 0),
                          child: ElevatedButton(
                            onPressed: (){
                              setState((){
                                updateUserInfo(snapshot.data!.id, _nameController.text, _phoneNController.text, context);
                                name = _nameController.text;
                                phone = _phoneNController.text;
                              });
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  AppColor.primaryColor50),
                            ),
                            child: const Text('Cập nhật', style: TextStyle(color: Colors.black),),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const Center(child: Text('Lỗi'));
            }
        )
      )
    );
  }
}