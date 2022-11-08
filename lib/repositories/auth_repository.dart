import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../model/token/token.dart';

Future<Token> authLogin(email) async {
  final response = await http.get(
      Uri.parse('https://cotam.azurewebsites.net/api/auth-houseworker/houseworkers/login-ver?email=$email'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
      }
  );

  final responseJson = jsonDecode(response.body);
  return Token.fromJson(responseJson);
}