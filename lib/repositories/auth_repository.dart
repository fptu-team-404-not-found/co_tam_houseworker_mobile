import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/jwt/jwt.dart';
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

Future<JWT> jwtDecode() async {
  final prefs = await SharedPreferences.getInstance();

  final accessToken = prefs.getString('accessToken');
  Map<String, dynamic> payload = Jwt.parseJwt(accessToken.toString());
  JWT jwt = JWT.fromJson(payload);

  return jwt;
}