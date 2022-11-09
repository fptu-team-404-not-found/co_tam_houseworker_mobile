
import 'dart:convert';

import '../model/area/area.dart';
import 'package:http/http.dart' as http;

import '../model/responseModel/response_model.dart';

Future<Area> fetchAreaById(int id) async {
  final response = await http.get(Uri.parse('https://cotam.azurewebsites.net/api/areas/$id'));

  final responseJson = jsonDecode(response.body);
  ResponseModel responseModel = ResponseModel.fromJson(responseJson);
  return Area.fromJson(responseModel.data);
}