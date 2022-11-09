
import 'dart:convert';

import 'package:co_tam_houseworker_mobile/model/houseworker/houseworker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/jwt/jwt.dart';
import 'auth_repository.dart';



/// get houseworker information
Future<Houseworker> fetchHouseworkerById() async {
  JWT jwt = await jwtDecode();
  int id = int.parse(jwt.id);
  final response = await http.get(Uri.parse('https://cotam.azurewebsites.net/api/houseworkers/$id'));

  final responseJson = jsonDecode(response.body);
  return Houseworker.fromJson(responseJson);
}

Future updateUserInfo(id, name, phone, context) async {
  var response = await http.put(
      Uri.parse("https://cotam.azurewebsites.net/api/houseworkers"),
      headers : {'Content-Type': 'application/json', 'charset': 'utf-8'},
      body:
      jsonEncode({
        "id": id,
        "name": name,
        "phone": phone,
      })
  );
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Your info has been updated")));
  }else{
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("unsuccessful")));
  }
}