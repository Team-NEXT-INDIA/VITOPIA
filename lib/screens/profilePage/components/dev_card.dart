import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../customs/ontapscale.dart';

class DevCardBuild extends StatelessWidget {
  final String name;
  final String subtitle;

  final String image;

  DevCardBuild({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: () {
        _dialogBuilder(context);
      },
      child: SizedBox(
        height: 110.h,
        width: 20.w,
        child: Card(
          color: Color(0xff1C1C1C),
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Ink.image(
                  //
                  //   child: InkWell(),
                  //   height: 140.h,
                  //   fit: BoxFit.cover,
                  // ),
                  Image.asset(
                    image,
                    height: 160.h,
                    width: 300.w,
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //     top: 10,
                  //     right: 10,
                  //     child: CircleAvatar(
                  //       radius: 26,
                  //       backgroundColor: Colors.white,
                  //       child: CircleAvatar(
                  //         radius: 22.0,
                  //         backgroundImage: NetworkImage(
                  //             'https://api.vitap.app/next_logo.png'),
                  //         backgroundColor: Colors.transparent,
                  //       ),
                  //     )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 16.h, left: 10.h, right: 15.h, bottom: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xff292929),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    image,
                    height: 140.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
              ),
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0x20c9c9c9),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.linkedinIn),
                      color: Colors.white70,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0x20c9c9c9),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.instagram),
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
