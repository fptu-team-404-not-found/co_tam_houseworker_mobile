import 'package:co_tam_houseworker_mobile/app/pages/home/home_view.dart';
import 'package:co_tam_houseworker_mobile/app/pages/houseworkerInformation/houseworker_information_page.dart';
import 'package:flutter/material.dart';
import '../pages/houseworkerInformation/houseworker_information_update_page.dart';
import '../pages/login/login_page.dart';
import '../pages/order/order_details.dart';
import '../pages/order/order_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'OrderPage':
        final index = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => OrderPage(indexPage: index));
      case 'HouseworkerInformationPage':
        return MaterialPageRoute(builder: (_) => const HouseworkerInformationPage());
      case 'HouseworkerInformationUpdatePage':
        return MaterialPageRoute(builder: (_) => const HouseworkerInformationUpdatePage());
      case 'OrderDetailsPage':
        final index1 = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => OrderDetailsPage(orderId: index1));
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