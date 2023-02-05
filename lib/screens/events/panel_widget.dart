import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final String title;
  final String description;
  final String venue;
  const PanelWidget({
    Key? key,
    required this.controller,
    required this.title,
    required this.description,
    required this.venue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: <Widget>[
          SizedBox(height: 18.h),
          buildAboutText(),
        ],
      );

  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.montserrat(
                color: const Color(0xffffffff),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              description,
              style: GoogleFonts.montserrat(
                color: const Color(0xffDBDBDB),
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      );
}
