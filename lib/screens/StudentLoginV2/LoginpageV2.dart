import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/ontapscale.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

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
              SliverFillRemaining(
                child: Stack(children: [
                  Align(child: Image.asset("assets/images/vit_logo_white.png")),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/tree_logo.jpg',
                        ),
                      ),
                    ),
                    child: Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 100.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(36.r),
                                topRight: Radius.circular(36.r),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.h, 15.h, 30.h, 0.h),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  CustomTap(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/studenthome');
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF090419),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/google_logo.png',
                                            height: 30.h,
                                          ),
                                          SizedBox(
                                            width: 10.h,
                                          ),
                                          Text('Sign in with Google',
                                              style: GoogleFonts.montserrat(
                                                color: const Color(0xffCECECE),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
