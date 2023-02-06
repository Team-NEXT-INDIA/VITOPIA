import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
      onTap: () {},
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
}
