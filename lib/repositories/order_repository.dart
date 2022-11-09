/*Future<HisOrderOfCus> ShowHistoryOrder() async {
  final response = await http.get(
    Uri.parse('https://cotam.azurewebsites.net/api/orders/order-pending/1'),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );
  final responseJson = jsonDecode(response.body);
  return HisOrderOfCus.fromJson(responseJson);
}*/
