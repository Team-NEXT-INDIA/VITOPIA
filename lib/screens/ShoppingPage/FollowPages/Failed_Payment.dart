import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vitopia/customs/ontapscale.dart';

class PaymentFailed extends StatefulWidget {
  final String error;

  PaymentFailed({required this.error});

  @override
  State<PaymentFailed> createState() => _PaymentFailedState();
}

class _PaymentFailedState extends State<PaymentFailed>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
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
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 0,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(
          //     Icons.arrow_back_ios_new,
          //     color: Colors.white,
          //   ),
          // ),
          centerTitle: true,
          title: const Text(
            "FAILED",
            style: TextStyle(
              fontFamily: 'Monument Extended',
              color: Color(0xffFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeIn(
                child: Lottie.asset(
                  'assets/lottie/failed.json',
                  repeat: true,
                  width: double.infinity,
                  height: 200.h,
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
              Text(
                "Order Failed",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                indent: 40.h,
                endIndent: 40.h,
                height: 4.h,
                thickness: 2.h,
                color: Color(0x99444444),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              // Text(
              //   'Error',
              //   style: GoogleFonts.montserrat(
              //       color: Colors.redAccent,
              //       fontSize: 17.sp,
              //       fontWeight: FontWeight.w500),
              // ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.all(15.h),
                child: Text(
                  '${widget.error}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Color(0xCFDEDEDE),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTap(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .popAndPushNamed('/studenthome');
                  Navigator.pushNamed(context, '/shop');
                },
                child: Container(
                  height: 45.h,
                  width: 290.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go to Shop",
                        style: GoogleFonts.montserrat(
                            color: Color(0xff000000),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ));
  }
}
