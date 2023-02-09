import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/customs/ontapscale.dart';

import '../../../customs/colors.dart';
import '../webview_page.dart';

class PromoSlider extends StatefulWidget {
  @override
  _PromoSliderState createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  List sliderImages = [];

  @override
  void initState() {
    super.initState();
    _fetchSliderImages();
  }

  _fetchSliderImages() async {
    var response =
        await http.get(Uri.parse("http://216.48.191.15:1080/slider_images"));
    if (response.statusCode == 200) {
      setState(() {
        sliderImages = json.decode(response.body);
      });
    } else {
      throw Exception("Failed to load slider images");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (sliderImages.length == 0)
          SizedBox()
        else
          CarouselSlider(
            items: sliderImages.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomTap(
                    onTap: () {
                      if (image['action_url'] != null) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => WebViewPage(
                                    Url: image['action_url'],
                                    APP_BAR_NAME: image['app_bar_name'],
                                  )),
                        );
                      }
                      if (image['route_name'] != null) {
                        String routeName = image['route_name'];
                        if (routeName is String) {
                          Navigator.pushNamed(context, routeName);
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: image['image_url'],
                          width: double.infinity,
                          fit: BoxFit.fill,
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
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 130.h,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
            ),
          ),
      ],
    );
  }
}
