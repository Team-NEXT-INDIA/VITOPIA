import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedEvents extends StatelessWidget {
  const FeaturedEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.h),
      child: Column(
        children: [
          _header(),
          // https://source.unsplash.com/random/900×700/?fruit
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
                color: Color(0xff171719),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "See All",
              style: GoogleFonts.montserrat(
                color: Color(0xffC9C9C9),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
