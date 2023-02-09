import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../customs/colors.dart';
import '../../../customs/ontapscale.dart';

class FeatureCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String time;
  final String location;
  final String image;
  final Function()? onTap;

  const FeatureCards(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.time,
      required this.location,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.h, 8.h, 8.h, 8.h),
      child: CustomTap(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
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
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: -25,
                        blurRadius: 50,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: SmoothClipRRect(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(25.r),
                    side: BorderSide(color: Color(0xff181818), width: 0.8),
                    child: Stack(children: [
                      Hero(
                        tag: image,
                        child: CachedNetworkImage(
                          imageUrl: image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer(
                            child: Container(
                              width: double.infinity,
                              color: Colors.black87,
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            height: 140.h,
                            width: 135.h,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Failed To Load Image",
                                    style: GoogleFonts.montserrat(
                                      color: primaryText,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        from: 30,
                        child: Column(
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
                                      Color(0xff090014),
                                      Colors.black12.withOpacity(0.0)
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.h, 10.h, 0.h, 6.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(40),
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
                      ),
                    ]),
                  ),
                ),
              ),
              // Column(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Align(
              //       alignment: Alignment.bottomCenter,
              //       child: Container(
              //         height: 100.h,
              //         width: double.infinity,
              //         decoration: ShapeDecoration(
              //           shape: SmoothRectangleBorder(
              //             borderRadius: BorderRadius.circular(25.r),
              //             smoothness: 0.9,
              //           ),
              //           gradient: LinearGradient(
              //             end: Alignment(0.0, -1),
              //             begin: Alignment(0.0, 0),
              //             colors: <Color>[
              //               const Color(0xff090014),
              //               Colors.black12.withOpacity(0.0)
              //             ],
              //           ),
              //         ),
              //         child: Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(
              //               18.h, 10.h, 0.h, 6.h),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 subtitle,
              //                 overflow: TextOverflow.ellipsis,
              //                 style: GoogleFonts.montserrat(
              //                   shadows: <Shadow>[
              //                     Shadow(
              //                       offset: Offset(2, 2),
              //                       blurRadius: 29,
              //                       color: Color.fromRGBO(0, 0, 0, 1),
              //                     ),
              //                     Shadow(
              //                       offset: Offset(2, 2),
              //                       blurRadius: 29,
              //                       color: Color.fromRGBO(0, 0, 0, 1),
              //                     )
              //                   ],
              //                   fontSize: 14.sp,
              //                   fontWeight: FontWeight.w500,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               Text(
              //                 title,
              //                 overflow: TextOverflow.clip,
              //                 style: GoogleFonts.montserrat(
              //                   fontSize: 15.sp,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //                 maxLines: 2,
              //               ),
              //               SizedBox(
              //                 height: 10.h,
              //               ),
              //               Container(
              //                 height: 30.h,
              //                 width: 90.w,
              //                 child: Center(
              //                   child: Text(
              //                     "View",
              //                     style: GoogleFonts.montserrat(
              //                       fontSize: 15.sp,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //                 decoration: ShapeDecoration(
              //                   shape: SmoothRectangleBorder(
              //                     borderRadius: BorderRadius.circular(40),
              //                     smoothness: 0.6,
              //                   ),
              //                   color: Color(0x16FFFFFF),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
