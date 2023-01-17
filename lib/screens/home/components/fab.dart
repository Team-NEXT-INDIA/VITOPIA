import 'package:animate_do/animate_do.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../customs/CameraScreen.dart';
import '../../../customs/animation/custom_page_transition.dart';

Widget buildFAB(context) => AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      width: 45.h,
      height: 45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient:
              LinearGradient(colors: [Color(0xff356C8A), Color(0xff5AA5B9)])),
      child: FloatingActionButton.small(
        elevation: 20,
        tooltip: 'Scan QR Code',
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xffD3D7D8),
        onPressed: () {
          Navigator.of(context).push(
            MyCustomAnimatedRoute(
              enterWidget: cameraScreen(),
            ),
          );
        },
        child: FadeIn(
          child: Center(
              child: Icon(
            FluentIcons.qr_code_20_filled,
            size: 32.sp,
          )),
        ),
      ),
    );

Widget buildExtendedFAB(context) => AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      width: 130.w,
      height: 45.h,
      child: Container(
        height: 50.h,
        width: 150.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            gradient:
                LinearGradient(colors: [Color(0xff356C8A), Color(0xff5AA5B9)])),
        child: FloatingActionButton.extended(
          elevation: 20,
          icon: FadeIn(child: Icon(FluentIcons.qr_code_20_filled)),
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.of(context).push(
              MyCustomAnimatedRoute(
                enterWidget: cameraScreen(),
              ),
            );
          },
          label: FadeIn(
            child: Text(
              "Scan QR",
              style: GoogleFonts.montserrat(
                color: Color(0xffD3D7D8),
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
