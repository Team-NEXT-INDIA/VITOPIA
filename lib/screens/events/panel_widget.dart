import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitopia/customs/ontapscale.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final String title;
  final String description;
  final String venue;
  final String start;
  final String end;
  final String day;
  final String externalurl;
  const PanelWidget({
    Key? key,
    required this.controller,
    required this.title,
    required this.description,
    required this.venue,
    required this.start,
    required this.end,
    required this.day,
    required this.externalurl,
  }) : super(key: key);

  _launchURL() async {
    var url = Uri.parse(externalurl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TIME ',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xffffffff),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${start} - ${end}',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xffDBDBDB),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'ABOUT ',
              style: GoogleFonts.montserrat(
                color: const Color(0xffffffff),
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              style: GoogleFonts.montserrat(
                color: const Color(0xffDBDBDB),
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            if (externalurl == 'NOURL')
              SizedBox(
                height: 2.h,
              )
            else
              CustomTap(
                onTap: _launchURL,
                child: Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OPEN URL',
                        style: GoogleFonts.montserrat(
                          color: Color(0xff040018),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
}
