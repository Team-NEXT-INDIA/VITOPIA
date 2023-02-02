import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vitopia/customs/ontapscale.dart';

import '../provider/google_sign_in.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  bool _startlogin = false;
  @override
  Widget build(BuildContext context) {
    final scaffoldBg = Color(0xff101010);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle.light, // this will make the app bar white
        child: Scaffold(
          // resizeToAvoidBottomInset: true,

          backgroundColor: scaffoldBg,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInRight(
                      from: 30,
                      duration: Duration(milliseconds: 490),
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 140.w,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 92.h, top: 44.h),
                            child: Text(
                              "2023",
                              style: GoogleFonts.montserrat(
                                color: Color(0xffFAFAFA),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                      ]),
                    ),
                    Image.asset(
                      'assets/images/vit_logo_white.png',
                      width: 80.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                FadeIn(
                  child: Row(
                    children: [
                      Text(
                        "LOG IN",
                        style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                FadeIn(
                    duration: Duration(milliseconds: 500),
                    child: getTextField(hint: "Username", labeltext: 'EMAIL')),
                SizedBox(
                  height: 25.h,
                ),
                FadeIn(
                    duration: Duration(milliseconds: 590),
                    child:
                        getTextField(hint: "Password", labeltext: 'PASSWORD')),
                SizedBox(
                  height: 50.h,
                ),
                FadeIn(
                  duration: Duration(milliseconds: 600),
                  child: CustomTap(
                    onTap: () {
                      Navigator.of(context).pushNamed('/studenthome');
                    },
                    child: Container(
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xff090419)),
                      child: Center(
                        child: Text(
                          "CONNECT WITH GOOGLE",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    CustomTap(
                      onTap: () {},
                      child: Container(
                        height: 40.h,
                        width: 168.w,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border:
                                Border.all(color: Colors.white, width: 0.6)),
                        child: Center(
                          child: Text(
                            "HELP",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffffffff)),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin(context, Navigator.pushNamed);
                    },
                    child: Text('Sign up with google ')),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        height: 20.h,
                        child: Center(
                          child: Text(
                            "EXTERNAL STUDENT? LOGIN HERE",
                            style: GoogleFonts.montserrat(
                                fontSize: 10.sp, color: Color(0xffe1e1e1)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 118.h,
                ),
                Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(fontSize: 30, color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Your privacy is our top concern and we want you to know how we process your personal information."
                                " By continuing you confirm that you've read and accepted",
                            style: GoogleFonts.montserrat(
                                fontSize: 6.sp, color: Color(0xff686868)),
                          ),
                          TextSpan(
                            text: " Terms",
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                fontSize: 9.sp,
                                color: Color(0xff686868)),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: " and ",
                            style: GoogleFonts.montserrat(
                                fontSize: 9.sp, color: Color(0xff686868)),
                          ),
                          TextSpan(
                            text: "Policy",
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                fontSize: 9.sp,
                                color: Color(0xff686868)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getTextField({required String hint, required String labeltext}) {
  final textFieldColor = CupertinoColors.darkBackgroundGray;
  return TextField(
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: GoogleFonts.montserrat(color: Color(0xff5B5B5B)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.r),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff474747)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF3F3F3)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
        filled: false,
        fillColor: Colors.transparent,
        hintStyle: GoogleFonts.montserrat(
          color: Color(0xff5B5B5B),
          fontSize: 14.sp,
          fontWeight: FontWeight.w200,
        )),
  );
}
