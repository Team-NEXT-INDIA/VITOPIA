import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../customs/colors.dart';
import '../../../customs/ontapscale.dart';

class TicketCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String sub_category;
  final String description;
  final String SKU;

  final String image;
  final Function()? onTap;

  TicketCard({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.image,
    this.onTap,
    required this.sub_category,
    required this.description,
    required this.SKU,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTap(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.h),
          child: Container(
            height: 130.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xff1C1C1C),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                Container(
                  height: 150.h,
                  width: 120.h,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r)),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer(
                        child: Container(
                          width: double.infinity,
                          color: Colors.black87,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        height: 140.h,
                        width: 135.h,
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
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140.w,
                        child: Text(
                          productName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                            color: const Color(0xffffffff),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        SKU,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.montserrat(
                          color: Color(0x5effffff),
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16.sp,
                            color: const Color(0x84ececec),
                          ),
                          Text(
                            sub_category,
                            style: GoogleFonts.montserrat(
                              color: const Color(0xdaececec),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        '₹ ${productPrice}',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff39FF65),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
