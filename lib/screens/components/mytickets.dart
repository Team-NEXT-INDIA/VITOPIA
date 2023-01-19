import 'package:barcode_widget/barcode_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/colors.dart';
import 'package:vitopia/customs/ontapscale.dart';

import '../../customs/ticket_widget.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({
    Key? key,
    required this.data2,
  }) : super(key: key);

  final String data2;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          CustomTap(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 8.0.h),
              child: TicketWidget(
                color: ticketsBackground,
                width: 350.0.w,
                height: 180.0.h,
                isCornerRounded: true,
                child: Padding(
                  padding: EdgeInsets.all(18.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 115.0.w,
                            height: 20.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0.r),
                              border: Border.all(
                                  width: 1.0.w, color: Color(0x52ffffff)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FluentIcons.building_24_regular,
                                    color: lightPurple,
                                    size: 15.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'AB-2  | 404',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                        color: lightPurple),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 08.r,
                                backgroundColor: Color(0x52ffffff),
                                child: CircleAvatar(
                                  backgroundColor: lightPurple,
                                  radius: 06.r,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 04.h, top: 9.0.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beat the Heat',
                              style: GoogleFonts.montserrat(
                                  color: primaryText,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Looking for a fun, affordable, professional, and'
                              'organised dance competition?  Turn It Up....',
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.montserrat(
                                  color: secondaryText,
                                  fontSize: 9.0.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 290.w,
                                height: 64.h,
                                child: BarcodeWidget(
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0x39FFFFFF)),
                                  color: Color(0x39FFFFFF),
                                  barcode: Barcode.code128(),
                                  data: data2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomTap(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 8.0.h),
              child: TicketWidget(
                color: ticketsBackground,
                width: 350.0.w,
                height: 180.0.h,
                isCornerRounded: true,
                child: Padding(
                  padding: EdgeInsets.all(18.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 115.0.w,
                            height: 20.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0.r),
                              border: Border.all(
                                  width: 1.0.w, color: Color(0x52ffffff)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FluentIcons.building_24_regular,
                                    color: lightPurple,
                                    size: 15.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'AB-2  | 404',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                        color: lightPurple),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 08.r,
                                backgroundColor: Color(0x52ffffff),
                                child: CircleAvatar(
                                  backgroundColor: lightPurple,
                                  radius: 06.r,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 04.h, top: 9.0.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beat the Heat',
                              style: GoogleFonts.montserrat(
                                  color: primaryText,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Looking for a fun, affordable, professional, and'
                              'organised dance competition?  Turn It Up....',
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.montserrat(
                                  color: secondaryText,
                                  fontSize: 9.0.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 290.w,
                                height: 64.h,
                                child: BarcodeWidget(
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0x39FFFFFF)),
                                  color: Color(0x39FFFFFF),
                                  barcode: Barcode.code128(),
                                  data: data2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomTap(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 8.0.h),
              child: TicketWidget(
                color: ticketsBackground,
                width: 350.0.w,
                height: 180.0.h,
                isCornerRounded: true,
                child: Padding(
                  padding: EdgeInsets.all(18.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 115.0.w,
                            height: 20.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0.r),
                              border: Border.all(
                                  width: 1.0.w, color: Color(0x52ffffff)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FluentIcons.building_24_regular,
                                    color: lightPurple,
                                    size: 15.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'AB-2  | 404',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                        color: lightPurple),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 08.r,
                                backgroundColor: Color(0x52ffffff),
                                child: CircleAvatar(
                                  backgroundColor: lightPurple,
                                  radius: 06.r,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 04.h, top: 9.0.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beat the Heat',
                              style: GoogleFonts.montserrat(
                                  color: primaryText,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Looking for a fun, affordable, professional, and'
                              'organised dance competition?  Turn It Up....',
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.montserrat(
                                  color: secondaryText,
                                  fontSize: 9.0.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 290.w,
                                height: 64.h,
                                child: BarcodeWidget(
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0x39FFFFFF)),
                                  color: Color(0x39FFFFFF),
                                  barcode: Barcode.code128(),
                                  data: data2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomTap(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 8.0.h),
              child: TicketWidget(
                color: ticketsBackground,
                width: 350.0.w,
                height: 180.0.h,
                isCornerRounded: true,
                child: Padding(
                  padding: EdgeInsets.all(18.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 115.0.w,
                            height: 20.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0.r),
                              border: Border.all(
                                  width: 1.0.w, color: Color(0x52ffffff)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FluentIcons.building_24_regular,
                                    color: lightPurple,
                                    size: 15.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'AB-2  | 404',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                        color: lightPurple),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 08.r,
                                backgroundColor: Color(0x52ffffff),
                                child: CircleAvatar(
                                  backgroundColor: lightPurple,
                                  radius: 06.r,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 04.h, top: 9.0.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beat the Heat',
                              style: GoogleFonts.montserrat(
                                  color: primaryText,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Looking for a fun, affordable, professional, and'
                              'organised dance competition?  Turn It Up....',
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.montserrat(
                                  color: secondaryText,
                                  fontSize: 9.0.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 290.w,
                                height: 64.h,
                                child: BarcodeWidget(
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0x39FFFFFF)),
                                  color: Color(0x39FFFFFF),
                                  barcode: Barcode.code128(),
                                  data: data2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: 177.0.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          pageSnapping: true,
          padEnds: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
        ));
  }
}
