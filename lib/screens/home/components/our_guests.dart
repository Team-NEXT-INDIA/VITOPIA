import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestHeader extends StatefulWidget {
  GuestHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<GuestHeader> createState() => _GuestHeaderState();
}

class _GuestHeaderState extends State<GuestHeader> {
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
      ],
    );
  }
}

class GustAvatar extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String comingevent;

  GustAvatar(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.comingevent})
      : super(key: key);

  @override
  State<GustAvatar> createState() => _GustAvatarState();
}

class _GustAvatarState extends State<GustAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.h),
      child: Container(
        height: 120.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: Color(0x56615980),
              child: CircleAvatar(
                radius: 35.r,
                backgroundImage: CachedNetworkImageProvider(
                  widget.image,
                ),
                backgroundColor: Color(0xff000000),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              widget.name,
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
    );
  }
}
