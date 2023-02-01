import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vitopia/screens/Intro/splash_screen.dart';
import 'package:vitopia/screens/ShoppingPage/Data/product_data_class.dart';
import 'package:vitopia/screens/ShoppingPage/InvoicePage.dart';
import 'package:vitopia/screens/ShoppingPage/MyOrders.dart';
import 'package:vitopia/screens/ShoppingPage/product_view.dart';
import 'package:vitopia/screens/StudentLoginV2/LoginpageV2.dart';
import 'package:vitopia/screens/ShoppingPage/shopping_page.dart';
import 'package:vitopia/screens/login/student_login.dart';
import 'package:vitopia/screens/profilePage/profile_page.dart';
import 'package:vitopia/screens/provider/google_sign_in.dart';

import 'helpers/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  //initilization of Firebase app

  // other Firebase service initialization

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
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
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
            }
          },
          debugShowCheckedModeBanner: false,
        ),
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
