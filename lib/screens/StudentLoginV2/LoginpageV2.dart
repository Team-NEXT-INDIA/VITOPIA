import 'dart:io';

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

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  void dispose() {
    super.dispose();
  }

  bool _startlogin = false;
  bool _startloginApple = false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.black,
          body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            // scrollBehavior: ScrollBehavior(),
            // dragStartBehavior: DragStartBehavior.down,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              // assets/images/tree_logo.jpg
              SliverFillRemaining(
                child: Stack(children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/tree_logo.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.03, -0.37),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 85.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.h, top: 40.h),
                    child: Align(
                      alignment: AlignmentDirectional(1, -1),
                      child: Image.asset(
                        'assets/images/vit_logo_white.png',
                        height: 30.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FadeInUp(
                    from: 70,
                    duration: Duration(milliseconds: 600),
                    child: Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(27.r),
                            topRight: Radius.circular(27.r),
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color(0x3f000000),
                          //     offset: Offset(0, 4),
                          //     blurRadius: 25,
                          //   ),
                          // ],
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30.h, 15.h, 30.h, 0.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 5.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xfff8f8f8),
                                          borderRadius:
                                              BorderRadius.circular(50.r)),
                                    ),
                                  ],
                                ),
                              ),
                              Text('Welcome!',
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xFF070707),
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w800,
                                  )),
                              Text(
                                  'Continue with your University account to Get Full Access',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xFF727272),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(
                                height: 17.h,
                              ),
                              CustomTap(
                                onTap: () {
                                  try {
                                    setState(() {
                                      _startlogin = true;
                                    });
                                    final provider =
                                        Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false);

                                    provider.googleLogin(
                                        context, Navigator.pushNamed);

                                    Future.delayed(
                                      const Duration(seconds: 10),
                                      () {
                                        setState(() {
                                          _startlogin = false;
                                        });
                                      },
                                    );
                                  } catch (e, s) {
                                    print(s.toString());

                                    setState(() {
                                      _startlogin = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 40.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF090419),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/google_logo.png',
                                        height: 30.h,
                                      ),
                                      SizedBox(
                                        width: 10.h,
                                      ),
                                      _startlogin
                                          ? const CupertinoActivityIndicator(
                                              color: Colors.white,
                                            )
                                          : Text('Sign in with Google',
                                              style: GoogleFonts.montserrat(
                                                color: const Color(0xffCECECE),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Platform.isIOS
                                  ? CustomTap(
                                      onTap: () {
                                        try {
                                          setState(() {
                                            _startloginApple = true;
                                          });
                                          final provider =
                                              Provider.of<GoogleSignInProvider>(
                                                  context,
                                                  listen: false);

                                          provider.appleLogin(
                                              context, Navigator.pushNamed);

                                          Future.delayed(
                                            const Duration(seconds: 10),
                                            () {
                                              setState(() {
                                                _startloginApple = false;
                                              });
                                            },
                                          );
                                        } catch (e, s) {
                                          print(s.toString());

                                          setState(() {
                                            _startloginApple = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 40.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF090419),
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/apple-logo.png',
                                              height: 19.h,
                                            ),
                                            SizedBox(
                                              width: 10.h,
                                            ),
                                            _startloginApple
                                                ? const CupertinoActivityIndicator(
                                                    color: Colors.white,
                                                  )
                                                : Text('Sign in with Apple',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: const Color(
                                                          0xffCECECE),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              // SizedBox(
                              //   height: 17.h,
                              // ),
                              // CustomTap(
                              //   onTap: () {
                              //     final snackBar = SnackBar(
                              //       behavior: SnackBarBehavior.floating,
                              //       content: Text('Try Again Later'),
                              //       action: SnackBarAction(
                              //         label: 'Dismiss',
                              //         onPressed: () {
                              //           ScaffoldMessenger.of(context)
                              //               .hideCurrentSnackBar();
                              //         },
                              //       ),
                              //     );
                              //     ScaffoldMessenger.of(context)
                              //         .showSnackBar(snackBar);
                              //   },
                              //   child: Container(
                              //     height: 40.h,
                              //     width: MediaQuery.of(context).size.width,
                              //     decoration: BoxDecoration(
                              //         color: const Color(0xFF090419),
                              //         borderRadius: BorderRadius.circular(8.r)),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Image.asset(
                              //           'assets/images/linkedin_logo.png',
                              //           height: 17.h,
                              //         ),
                              //         SizedBox(
                              //           width: 10.h,
                              //         ),
                              //         Text('Sign in with Linkedin',
                              //             style: GoogleFonts.montserrat(
                              //               color: const Color(0xffCECECE),
                              //               fontSize: 14.sp,
                              //               fontWeight: FontWeight.w600,
                              //             )),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 17.h,
                              ),
                              Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text:
                                              "Your privacy is our top concern and we want you to know how we process your personal information."
                                              " By continuing you confirm that you've accepted",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 6.sp,
                                              color: Color(0xff686868)),
                                        ),
                                        TextSpan(
                                          text: " Terms",
                                          style: GoogleFonts.montserrat(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 9.sp,
                                              color: Color(0xff686868)),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                        ),
                                        TextSpan(
                                          text: " and ",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 9.sp,
                                              color: Color(0xff686868)),
                                        ),
                                        TextSpan(
                                          text: "Policy",
                                          style: GoogleFonts.montserrat(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 9.sp,
                                              color: Color(0xff686868)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
