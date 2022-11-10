import 'package:co_tam_houseworker_mobile/app/pages/home/home_view.dart';
import 'package:co_tam_houseworker_mobile/app/pages/houseworkerInformation/houseworker_information_page.dart';
import 'package:co_tam_houseworker_mobile/app/pages/notification/notification_view.dart';
import 'package:flutter/material.dart';
import '../pages/houseworkerInformation/houseworker_information_update_page.dart';
import '../pages/login/login_page.dart';
import '../pages/order/order_popup.dart';
import '../pages/order/order_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'OrderPage':
        return MaterialPageRoute(builder: (_) => const OrderPage());
      case 'NotificationPage':
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case 'HouseworkerInformationPage':
        return MaterialPageRoute(builder: (_) => const HouseworkerInformationPage());
      case 'HouseworkerInformationUpdatePage':
        return MaterialPageRoute(builder: (_) => const HouseworkerInformationUpdatePage());
      case 'OrderPopupPage':
        return MaterialPageRoute(builder: (_) => const OrderPopupPage());
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