import 'package:co_tam_houseworker_mobile/app/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import '../pages/login/login_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}