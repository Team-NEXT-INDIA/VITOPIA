import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
    _controller = AnimationController(vsync: this);
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    Timer(const Duration(seconds: 7), () async {
      if (await provider.googleSignIn.isSignedIn()) {
        Navigator.of(context).pushNamed('/studenthome');
      } else {
        Navigator.of(context).pushNamed('/login');
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
