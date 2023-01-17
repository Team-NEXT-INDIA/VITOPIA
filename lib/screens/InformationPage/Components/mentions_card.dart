import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../customs/ontapscale.dart';

class MentionsCardBuild extends StatelessWidget {
  final String name;
  final String subtitle;

  final String image;

  MentionsCardBuild({
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
        height: 240.h,
        width: 135.h,
        child: Card(
          color: Color(0xffF5F5F5),
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
                  CachedNetworkImage(
                    imageUrl: image,
                    height: 140.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer(
                      child: Container(
                        height: 140.h,
                        width: 135.h,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                  //         backgroundColor:
                  //             Colors.transparent,
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
                        color: Color(0xff333333),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.montserrat(
                        color: Color(0xff4A4D4E),
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
