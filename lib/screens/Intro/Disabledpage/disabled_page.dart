import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisabledPage extends StatefulWidget {
  const DisabledPage({Key? key}) : super(key: key);

  @override
  State<DisabledPage> createState() => _DisabledPageState();
}

class _DisabledPageState extends State<DisabledPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Column(
        children: [
          FadeIn(
            child: Lottie.asset(
              'assets/lottie/sucess.json',
              repeat: true,
              width: double.infinity,
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..repeat(period: Duration(minutes: 2))
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          ),
        ],
      ),
    );
  }
}
