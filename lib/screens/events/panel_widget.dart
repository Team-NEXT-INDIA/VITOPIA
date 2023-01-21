import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  const PanelWidget({
    Key? key,
    required this.controller,
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
              "hello",
              style: GoogleFonts.montserrat(
                color: const Color(0xffffffff),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
              "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
              " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:"
              "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
              "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
              " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:"
              "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
              "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
              " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:"
              "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
              "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
              " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:",
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
