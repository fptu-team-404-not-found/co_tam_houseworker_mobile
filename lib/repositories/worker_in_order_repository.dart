import 'dart:convert';
import 'dart:io';

import 'package:co_tam_houseworker_mobile/model/responseModel/response_model.dart';
import 'package:co_tam_houseworker_mobile/model/workerInOrder/worker_in_order.dart';
import 'package:http/http.dart' as http;

Future<List<WorkerInOrder>> getListWorkerInOrderByHouseWorkerId() async {
  final response = await http.get(
    Uri.parse('https://cotam.azurewebsites.net/api/work-in-order/houseworkers/1'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  final responseJson = jsonDecode(response.body);
  ResponseModel responseModel = ResponseModel.fromJson(responseJson);
  List<dynamic> listData = responseModel.data;
  final result = List<WorkerInOrder>.empty(growable: true);
  for (var data in listData) {
    result.add(WorkerInOrder.fromJson(data));
  }
  return result;
}