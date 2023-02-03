import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../customs/colors.dart';
import '../InformationPage/mentioncolor.dart';

// https://wallpaper.dog/large/20497496.jpg
class TicketShop extends StatefulWidget {
  TicketShop({Key? key}) : super(key: key);

  @override
  State<TicketShop> createState() => _TicketShopState();
}

class _TicketShopState extends State<TicketShop> {
  var colorizeTextStyle = TextStyle(
    fontFamily: 'Monument Extended',
    color: const Color(0xffFFFFFF),
    fontSize: 29.sp,
    fontWeight: FontWeight.bold,
  );
  var colorizeColors = [
    const Color(0xffffffff),
    const Color(0xffcccccc),
    const Color(0xffd3d3d3),
    const Color(0xff7c7c7c),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _loadProducts,
        //   child: const Icon(Icons.refresh),
        // ),
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 170.h,
                stretch: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                    child: Container(
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          stops: [0, 0.7],
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "https://wallpaper.dog/large/20497496.jpg",
                        width: double.infinity,
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
                ),
                pinned: true,
                backgroundColor: mscaffoldBackground,
                surfaceTintColor: const Color(0xff37016b),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(72.h),
                  child: Padding(
                    padding: EdgeInsets.only(top: 17.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: FadeIn(
                            child: AnimatedTextKit(
                              totalRepeatCount: 1000,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  'GRAB YOUR TICKETS',
                                  textStyle: colorizeTextStyle,
                                  textAlign: TextAlign.center,
                                  colors: colorizeColors,
                                ),
                              ],
                              isRepeatingAnimation: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Container(
                  height: 150.h,
                  child: Row(
                    children: [
                      Container(
                        height: 150.h,
                        width: 120.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                bottomLeft: Radius.circular(15.r))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              bottomLeft: Radius.circular(15.r)),
                          child: Image.network(
                            'https://i.ibb.co/hD7FHGb/STANDUP-COMEDY.png',
                            fit: BoxFit.cover,
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
                            Text(
                              'Comedy show',
                              style: GoogleFonts.montserrat(
                                color: Color(0xffffffff),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'A virtually real-time \nexperience Fun and relistic ',
                              style: GoogleFonts.montserrat(
                                color: Color(0xffffffff),
                                fontSize: 10.sp,
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
                                  size: 17.sp,
                                  color: Color(0x84ececec),
                                ),
                                Text(
                                  'AB-2 304',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0x84ececec),
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
                              '₹ 1000',
                              style: GoogleFonts.montserrat(
                                color: Color(0xff39FF65),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff1C1C1C),
                      borderRadius: BorderRadius.circular(15.r)),
                ),
              )
            ],
          ),
        ));
  }
}
