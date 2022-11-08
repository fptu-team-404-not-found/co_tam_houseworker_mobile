
import 'dart:convert';

import 'package:co_tam_houseworker_mobile/model/houseworker.dart';
import 'package:http/http.dart' as http;


/// get houseworker information
Future<Houseworker> fetchHouseworkerById(int id) async {
  final response = await http.get(Uri.parse('https://cotam.azurewebsites.net/api/houseworkers/1'));

  final responseJson = jsonDecode(response.body);
  return Houseworker.fromJson(responseJson);
}