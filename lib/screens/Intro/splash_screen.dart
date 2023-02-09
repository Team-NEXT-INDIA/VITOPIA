import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/google_sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    Future<http.Response> getAppStatusFromAPI() async {
      final String _specials = "http://216.48.191.15:1080/app-status";
      final response = await http.get(Uri.parse(_specials));
      if (response.statusCode == 200) {
        print(response.body);
        return Future.value(response);
      } else {
        return Future.error("Failed to get app status from API");
      }
    }

    _controller = AnimationController(vsync: this);
    Timer(const Duration(seconds: 7), () async {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      print(email);
      if (email != null) {
        try {
          final response = await getAppStatusFromAPI();
          final decodedResponse = json.decode(response.body);
          if (decodedResponse['status'] == 'disabled') {
            Navigator.pushReplacementNamed(context, '/disabledview');
          } else {
            Navigator.pushReplacementNamed(context, '/studenthome');
          }
        } catch (error) {
          Navigator.pushReplacementNamed(context, '/studenthome');
          final snackBar = SnackBar(
            content: Text("No Internet Connection"),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 580.h,
                child: Lottie.asset(
                  'assets/images/logo-animation.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    _controller
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
              CupertinoActivityIndicator(
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
