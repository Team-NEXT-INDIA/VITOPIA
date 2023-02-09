import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:vitopia/helpers/layout.dart';

import '../../../customs/ontapscale.dart';

class ForYouBuild extends StatelessWidget {
  const ForYouBuild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 13.h, top: 8.h, bottom: 10.h),
          child: Row(
            children: [
              // Text(
              //   "Registered Events",
              //   style: GoogleFonts.montserrat(
              //     color: const Color(0xffFFFFFF),
              //     fontSize: 20.sp,
              //     fontWeight: FontWeight.w800,
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 10.h),
              //   width: 55.0.w,
              //   height: 20.0.h,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30.0.r),
              //     border: Border.all(width: 1.0.w, color: Colors.green),
              //   ),
              //   child: Center(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           'New',
              //           style: GoogleFonts.montserrat(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 10.sp,
              //               color: Colors.green),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.h, left: 20.h, top: 02.h),
          child: Container(
              width: 297.h,
              height: 317.h,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  smoothness: 0.7,
                ),
                color: const Color(0xff101010),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 140.w,
                    ),
                    SizedBox(height: 20.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Grab your\n',
                        style: GoogleFonts.montserrat(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffE0E0E0)),
                        /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Tickets',
                            style: GoogleFonts.montserrat(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7AE1FF)),
                          ),
                          TextSpan(
                            text: ' to Attend\n',
                            style: GoogleFonts.montserrat(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffE0E0E0)),
                          ),
                          TextSpan(
                            text: 'Dont miss the',
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFFFFFF)),
                          ),
                          TextSpan(
                            text: ' ProShow 😉',
                            style: GoogleFonts.montserrat(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7AE1FF)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTap(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => Layout(index: 2),
                            transitionDuration: const Duration(seconds: 5),
                          ),
                        );
                      },
                      child: Container(
                        height: 45.h,
                        width: 144.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3, 3),
                              spreadRadius: -1,
                              blurRadius: 50,
                              color: Color.fromRGBO(239, 239, 239, 0.55),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            "Get Tickets",
                            style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff060606)),
                          ),
                        ),
                      ),
                    )
                  ])),
        ),
      ],
    );
  }
}
