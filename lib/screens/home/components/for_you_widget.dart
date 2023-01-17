import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:smooth_corner/smooth_corner.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "For You",
                style: GoogleFonts.montserrat(
                  color: const Color(0xff040507),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.h),
                width: 55.0.w,
                height: 20.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0.r),
                  border: Border.all(width: 1.0.w, color: Colors.green),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.h, left: 10.h, top: 02.h),
          child: Shimmer(
            // duration: Duration(seconds: 3), //Default value
            // interval: Duration(
            //     seconds: 5), //Default value: Duration(seconds: 0)
            color: Color(0xff7AE1FF), //Default value
            colorOpacity: 0.15, //Default value
            enabled: true, //Default value
            child: Container(
                width: 347.h,
                height: 347.h,
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
                          text: 'Confused which\n',
                          style: GoogleFonts.montserrat(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffE0E0E0)),
                          /*defining default style is optional */
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Event',
                              style: GoogleFonts.montserrat(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff7AE1FF)),
                            ),
                            TextSpan(
                              text: ' to Attend?\n',
                              style: GoogleFonts.montserrat(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffE0E0E0)),
                            ),
                            TextSpan(
                              text: 'Try our',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF)),
                            ),
                            TextSpan(
                              text: ' AI Event Selector',
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
                        onTap: () {},
                        child: Container(
                          height: 38.h,
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
                              "Try now",
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
        ),
      ],
    );
  }
}
