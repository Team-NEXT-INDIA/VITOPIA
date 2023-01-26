import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/customs/ontapscale.dart';

import '../../customs/colors.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Orders',
          style: TextStyle(
            fontFamily: 'Monument Extended',
            color: Color(0xffFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTap(
                  onTap: () {
                    Navigator.of(context).pushNamed('/invoice_page');
                  },
                  child: Container(
                    height: 150.h,
                    width: 400.h,
                    decoration: BoxDecoration(
                        color: Color(0xff696969),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CachedNetworkImage(
                              imageUrl: "https://i.ibb.co/GHFXdq9/t-shirt.jpg",
                              height: 100.h,
                              width: 100.h,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Black Vitopia Shirt',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'radium monkey printed',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '₹15000',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xff39FF65),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
