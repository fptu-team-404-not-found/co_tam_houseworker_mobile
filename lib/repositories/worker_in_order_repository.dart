import 'dart:convert';
import 'dart:io';

import 'package:co_tam_houseworker_mobile/model/responseModel/response_model.dart';
import 'package:co_tam_houseworker_mobile/model/workerInOrder/worker_in_order.dart';
import 'package:http/http.dart' as http;

import '../model/jwt/jwt.dart';
import 'auth_repository.dart';

class WorkerInOrderRepository {
  Future<List<WorkerInOrder>?> getListWorkerInOrderByHouseWorkerId() async {
    try {
      JWT jwt = await jwtDecode();
      int id = int.parse(jwt.id);

      var response = await http.get(
        Uri.parse('https://cotam.azurewebsites.net/api/work-in-order/houseworkers/$id'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        },
      );

      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        ResponseModel responseModel = ResponseModel.fromJson(responseJson);
        List<dynamic> listData = responseModel.data;
        List<WorkerInOrder> result = List<WorkerInOrder>.empty(growable: true);
        for (var data in listData) {
          result.add(WorkerInOrder.fromJson(data));
        }
        return result;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}