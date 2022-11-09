
import 'dart:convert';

import 'package:co_tam_houseworker_mobile/model/houseworker/houseworker.dart';
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