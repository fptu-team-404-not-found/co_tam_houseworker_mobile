import 'dart:convert';
import 'dart:io';

import 'package:co_tam_houseworker_mobile/model/customer/customer.dart';
import 'package:http/http.dart' as http;

import '../model/responseModel/response_model.dart';

class CustomerRepository {
  Future<Customer> getCustomerById(id) async {
    //https://cotam.azurewebsites.net/api/customers/1
    final response = await
    http.get(
        Uri.parse('https://cotam.azurewebsites.net/api/customers/$id'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        }
    );
    final responseJson = jsonDecode(response.body);
    ResponseModel responseModel = ResponseModel.fromJson(responseJson);
    return Customer.fromJson(responseModel.data);
  }
}