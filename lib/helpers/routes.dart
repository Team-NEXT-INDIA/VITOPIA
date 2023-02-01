import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/Intro/splash_screen.dart';
import '../screens/ShoppingPage/Data/product_data_class.dart';
import '../screens/ShoppingPage/InvoicePage.dart';
import '../screens/ShoppingPage/MyOrders.dart';
import '../screens/ShoppingPage/product_view.dart';
import '../screens/ShoppingPage/shopping_page.dart';
import '../screens/StudentLoginV2/LoginpageV2.dart';
import '../screens/profilePage/profile_page.dart';
import 'layout.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
            builder: (_) => const SplashScreen(), settings: settings);
      case '/login':
        return CupertinoPageRoute(
            builder: (_) => const Loginpage(), settings: settings);
      case '/studenthome':
        return CupertinoPageRoute(
            builder: (_) => const Layout(), settings: settings);
      case '/profile':
        return CupertinoPageRoute(
            builder: (_) => ProfilePage(), settings: settings);
      case '/shop':
        return CupertinoPageRoute(
            builder: (_) => const ShoppingPage(), settings: settings);
      case '/invoice_page':
        return CupertinoPageRoute(
            builder: (_) => const InvoicePage(), settings: settings);
      case '/orders':
        return CupertinoPageRoute(
            builder: (_) => const MyOrders(), settings: settings);

      case '/product_view':
        var product = settings.arguments as Product;
        return CupertinoPageRoute(
            builder: (_) => ProductDetailsView(
                  product: product,
                ),
            settings: settings);

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
