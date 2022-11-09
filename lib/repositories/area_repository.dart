
import 'dart:convert';

import '../model/area/area.dart';
import 'package:http/http.dart' as http;

Future<Area> fetchAreaById(int id) async {
  final response = await http.get(Uri.parse('https://cotam.azurewebsites.net/api/areas/$id'));

  final responseJson = jsonDecode(response.body);
  return Area.fromJson(responseJson);
}