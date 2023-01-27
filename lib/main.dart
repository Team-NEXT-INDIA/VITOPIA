import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitopia/screens/Intro/splash_screen.dart';
import 'package:vitopia/screens/ShoppingPage/Data/product_data_class.dart';
import 'package:vitopia/screens/ShoppingPage/product_view.dart';
import 'package:vitopia/screens/ShoppingPage/shopping_page.dart';
import 'package:vitopia/screens/StudentLoginV2/LoginpageV2.dart';
import 'package:vitopia/screens/login/student_login.dart';
import 'package:vitopia/screens/profilePage/profile_page.dart';

import 'helpers/layout.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return CupertinoPageRoute(
                  builder: (_) => SplashScreen(), settings: settings);
            case '/login':
              return CupertinoPageRoute(
                  builder: (_) => StudentLogin(), settings: settings);
            case '/loginv2':
              return CupertinoPageRoute(
                  builder: (_) => Loginpage(), settings: settings);
            case '/studenthome':
              return CupertinoPageRoute(
                  builder: (_) => Layout(), settings: settings);
            case '/profile':
              return CupertinoPageRoute(
                  builder: (_) => ProfilePage(), settings: settings);
            case '/shop':
              return CupertinoPageRoute(
                  builder: (_) => ShoppingPage(), settings: settings);
            case '/product_view':
              var product = settings.arguments as Product;
              return CupertinoPageRoute(
                  builder: (_) => ProductDetailsView(
                        product: product,
                      ),
                  settings: settings);
          }
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
