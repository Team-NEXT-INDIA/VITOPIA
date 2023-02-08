import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../customs/colors.dart';
import '../../../customs/ontapscale.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String sub_category;
  final String image;
  final Function()? onTap;

  ProductCard({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.image,
    this.onTap,
    required this.sub_category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: onTap,
      child: SizedBox(
        height: 240.h,
        width: 135.h,
        child: Card(
          color: Color(0x3a261f2d),
          // color: Colors.transparent,
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
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Failed To Load Image",
                              style: GoogleFonts.montserrat(
                                color: primaryText,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      height: 140.h,
                      width: 135.h,
                    ),
                  ),
                  // Positioned(
                  //     top: 10,
                  //     right: 10,
                  //     child: CircleAvatar(
                  //         radius: 26,
                  //         backgroundColor: Colors.white,
                  //         child: Icon(
                  //             FontAwesomeIcons.heart
                  //         ))),
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
                      productName,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      sub_category,
                      style: GoogleFonts.montserrat(
                        color: Color(0xff9B9898),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹",
                          style: GoogleFonts.montserrat(
                            color: Color(0xff39FF65),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          productPrice,
                          style: GoogleFonts.montserrat(
                            color: Color(0xff39FF65),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ],
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
