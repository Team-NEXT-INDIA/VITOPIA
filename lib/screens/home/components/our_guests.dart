import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestSlider extends StatefulWidget {
  const GuestSlider({Key? key}) : super(key: key);

  @override
  State<GuestSlider> createState() => _GuestSliderState();
}

class _GuestSliderState extends State<GuestSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeIn(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.h),
          child: Padding(
            padding: EdgeInsets.only(top: 9.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Guests",
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 120.h,
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 35.r,
                        backgroundColor: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Devi sri Prasad",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffffffff),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 120.h,
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 35.r,
                        backgroundColor: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "PV Sindhu",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffffffff),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
