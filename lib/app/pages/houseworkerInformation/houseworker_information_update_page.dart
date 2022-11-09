import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/houseworker/houseworker.dart';
import '../../../repositories/houseworker_repository.dart';
import '../../utils/constant.dart';
import '../../widgets/app_bar/top_app_bar.dart';
import '../../widgets/information/houseworker_information/field_update.dart';


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
                        child: Image.network(snapshot.data!.avatar == null ? 'https://i.pinimg.com/originals/5f/39/e6/5f39e6d606da1c3d603bdabfccf053f3.jpg' : snapshot.data!.avatar!.toString().toString()),
                      ),
                    ),
                    FieldUpdate(title: "Họ và tên", conroller: _nameController, hintText: name,),
                    FieldUpdate(title: "Điện thoại", conroller: _phoneNController, hintText: phone,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
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
                                  AppColor.primaryColor30),
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





/*
FieldUpdate(title: "Họ và tên", conroller: _nameController,hintText: name.toString(),),
FieldUpdate(title: "Điện thoại", conroller: _phoneNController,hintText: phone.toString(),),
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Container(
height: 50,
margin: const EdgeInsets.fromLTRB(0, 20, 25, 0),
child: ElevatedButton(
onPressed: (){
setState((){
updateUserInfo(_nameController.text, _phoneNController.text, context);
name = _nameController.text;
phone = _phoneNController.text;
});
},
child: const Text('Cập nhật', style: TextStyle(color: Colors.black),),
style: ButtonStyle(
backgroundColor:
MaterialStateProperty.all<Color>(
AppColor.primaryColor30),
),
),
),
],
),*/
