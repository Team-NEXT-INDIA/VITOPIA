import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../customs/ontapscale.dart';

class FeatureCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const FeatureCards({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.h, 8.h, 8.h, 8.h),
      child: CustomTap(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xfffefefe),
              strokeAlign: StrokeAlign.outside,
              width: 0.2.w,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -8,
                blurRadius: 35.r,
                color: Color.fromRGBO(0, 0, 0, 0.18),
              )
            ],
          ),
          width: 272.w,
          height: 355.4.h,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(1.h, 0.h, 0.h, 0.h),
                child: Container(
                  width: 272.w,
                  height: 355.4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: SmoothClipRRect(
                    smoothness: 0.9,
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.asset(
                      image,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100.h,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: SmoothRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          smoothness: 0.9,
                        ),
                        gradient: LinearGradient(
                          end: Alignment(0.0, -1),
                          begin: Alignment(0.0, 0),
                          colors: <Color>[
                            const Color(0xff000000),
                            Colors.black12.withOpacity(0.0)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.h, 10.h, 0.h, 6.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subtitle,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 29,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 29,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  )
                                ],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              title,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 30.h,
                              width: 90.w,
                              child: Center(
                                child: Text(
                                  "View",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: ShapeDecoration(
                                shape: SmoothRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  smoothness: 0.6,
                                ),
                                color: Color(0x16FFFFFF),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
