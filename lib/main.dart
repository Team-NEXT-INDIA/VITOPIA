import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitopia/screens/Intro/splash_screen.dart';
import 'package:vitopia/screens/ShoppingPage/shopping_page.dart';
import 'package:vitopia/screens/login/student_login.dart';
import 'package:vitopia/screens/profilePage/profile_page.dart';

import 'helpers/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? payment_response;

  //Live
  String mid = "LIVE_MID_HERE";
  String PAYTM_MERCHANT_KEY = "LIVE_KEY_HERE";
  String website = "DEFAULT";
  bool testing = false;

  //Testing
  // String mid = "TEST_MID_HERE";
  // String PAYTM_MERCHANT_KEY = "TEST_KEY_HERE";
  // String website = "WEBSTAGING";
  // bool testing = true;

  double amount = 1;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

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
            case '/studenthome':
              return CupertinoPageRoute(
                  builder: (_) => Layout(), settings: settings);
            case '/profile':
              return CupertinoPageRoute(
                  builder: (_) => ProfilePage(), settings: settings);
            case '/shop':
              return CupertinoPageRoute(
                  builder: (_) => ShoppingPage(), settings: settings);
          }
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
