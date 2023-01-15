import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitopia/screens/Intro/splash_screen.dart';
import 'package:vitopia/screens/login/student_login.dart';

import 'helpers/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
          }
        },
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(360, 640),
    );
  }
}
