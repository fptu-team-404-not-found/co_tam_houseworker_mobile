import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../domain/entities/model_test_fetch_api.dart';

Future<List<ModelTestFetchAPI>> getModels() async {
  const url =
      'https://cotam.azurewebsites.net/api/promotions?PageIndex=1&PageSize=5';
  final response = await get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body)['data'].map<ModelTestFetchAPI>(ModelTestFetchAPI.fromJson).toList();
  } else {
    throw Exception('Failed to load data.');
  }
/*const data = [
        {
          "id": 1,
          "code": "BIRTHDAY01",
          "description": "Giảm giá cực sốc nhân ngày sinh nhật của Cô Tấm",
          "value": null,
          "discount": 0.5,
          "amount": 999,
          "startDate": "2022-09-26T19:24:41.357",
          "endDate": "2022-10-03T10:37:40",
          "active": false,
          "customerPromotions": [],
          "orders": []
        },
        {
          "id": 2,
          "code": "SN1N",
          "description": "Sinh nhật",
          "value": null,
          "discount": 5000,
          "amount": 100000,
          "startDate": "2022-10-05T10:00:30",
          "endDate": "2022-10-06T10:00:30",
          "active": true,
          "customerPromotions": [],
          "orders": []
        },
        {
          "id": 3,
          "code": "hi",
          "description": "khong",
          "value": null,
          "discount": 2000,
          "amount": 10000,
          "startDate": "2022-10-22T08:48:39.117",
          "endDate": "2022-10-24T08:48:39",
          "active": false,
          "customerPromotions": [],
          "orders": []
        },
        {
          "id": 4,
          "code": "",
          "description": "",
          "value": null,
          "discount": 2,
          "amount": 5,
          "startDate": "2022-10-22T08:55:39.33",
          "endDate": "2022-10-21T08:55:39",
          "active": true,
          "customerPromotions": [],
          "orders": []
        },
        {
          "id": 5,
          "code": "Hello",
          "description": "sss",
          "value": null,
          "discount": 200000,
          "amount": 40000000,
          "startDate": "2022-10-22T08:56:20.943",
          "endDate": "2022-10-23T08:56:20",
          "active": true,
          "customerPromotions": [],
          "orders": []
        }
      ];*/
}

class TestFetchAPIPage extends StatefulWidget {
  const TestFetchAPIPage({Key? key}) : super(key: key);

  @override
  State<TestFetchAPIPage> createState() => _TestFetchAPIPageState();
}

class _TestFetchAPIPageState extends State<TestFetchAPIPage> {
  late Future<List<ModelTestFetchAPI>> futureModelTestFetchAPI;

  @override
  void initState() {
    super.initState();
    futureModelTestFetchAPI = getModels();
  }

  Widget buildModelTestFetchAPI(List<ModelTestFetchAPI> models) => ListView.builder(
    itemCount: models.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(models[index].code),
          subtitle: Text(models[index].description ?? ''),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Fetch API'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<ModelTestFetchAPI>?>(
          future: futureModelTestFetchAPI,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('No data.');
            } else if (snapshot.hasData) {
              return buildModelTestFetchAPI(snapshot.data!);
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

