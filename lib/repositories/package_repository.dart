import 'dart:convert';
import 'dart:io';

import 'package:co_tam_houseworker_mobile/model/package/package.dart';
import 'package:co_tam_houseworker_mobile/model/responseModel/response_model.dart';

import 'package:http/http.dart' as http;

class PackageRepository {
  Future<Package> getPackageById(id) async {
    final response = await
    http.get(
        Uri.parse('https://cotam.azurewebsites.net/api/packages/$id'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        }
    );
    final responseJson = jsonDecode(response.body);
    ResponseModel responseModel = ResponseModel.fromJson(responseJson);
    return Package.fromJson(responseModel.data);
  }
}