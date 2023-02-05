import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/ontapscale.dart';

class FeaturedEvents extends StatelessWidget {
  const FeaturedEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Featured Events",
                    style: GoogleFonts.montserrat(
                      color: Color(0xffFFFFFF),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              CustomTap(
                onTap: () {},
                child: Container(
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xfffffff)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "See All",
                        style: GoogleFonts.montserrat(
                          color: Color(0xffFFFFFF),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _header extends StatelessWidget {
  const _header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Featured Events",
              style: GoogleFonts.montserrat(
                color: Color(0xffFFFFFF),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        CustomTap(
          onTap: () {},
          child: Container(
            width: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xfffffff)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "See All",
                  style: GoogleFonts.montserrat(
                    color: Color(0xffFFFFFF),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
