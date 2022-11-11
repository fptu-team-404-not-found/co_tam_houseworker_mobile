import 'dart:convert';
import 'dart:io';

import 'package:co_tam_houseworker_mobile/model/responseModel/response_model.dart';

import '../model/order/order.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  Future<Order> getOrderById(id) async {
    //https://cotam.azurewebsites.net/api/orders/120
    final response = await
    http.get(
        Uri.parse('https://cotam.azurewebsites.net/api/orders/$id'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        }
    );
    final responseJson = jsonDecode(response.body);
    ResponseModel responseModel = ResponseModel.fromJson(responseJson);
    return Order.fromJson(responseModel.data);
  }

  void changeOrderStatusByOrderId(id) async {
    //https://cotam.azurewebsites.net/api/orders/change-order-status/120
    await http.delete(
      Uri.parse('https://cotam.azurewebsites.net/api/orders/change-order-status/$id'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
      }
    );
  }
}