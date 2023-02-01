// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:shimmer_animation/shimmer_animation.dart';
//
// import '../../../customs/colors.dart';
// import '../webview_page.dart';
//
// class CarouselWithIndicator extends StatefulWidget {
//   @override
//   _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
// }
//
// class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
//   int _current = 0;
//   List sliderImages = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _getSliderImages();
//   }
//
//   _getSliderImages() async {
//     var response =
//         await http.get(Uri.parse("http://10.0.2.2:1080/slider_images"));
//     if (response.statusCode == 200) {
//       setState(() {
//         sliderImages = json.decode(response.body);
//       });
//     } else {
//       throw Exception("Failed to load slider images");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CarouselSlider(
//           options: CarouselOptions(
//             height: 200.0,
//             aspectRatio: 16 / 9,
//             viewportFraction: 1.0,
//             initialPage: 0,
//             enableInfiniteScroll: false,
//             reverse: false,
//             autoPlay: true,
//             autoPlayInterval: Duration(seconds: 3),
//             autoPlayAnimationDuration: Duration(milliseconds: 800),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: false,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _current = index;
//               });
//             },
//           ),
//           items: sliderImages.map((image) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   decoration: BoxDecoration(color: Colors.amber),
//                   child: GestureDetector(
//                     onTap: () {
//                       if (image['action_url'] != null) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   WebViewPage(Url: image['action_url'])),
//                         );
//                       } else if (image['route_name'] != null) {
//                         Navigator.pushNamed(context, image['route_name']);
//                       }
//                     },
//                     child: CachedNetworkImage(
//                       imageUrl: image['image_url'],
//                       height: 140.h,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => Shimmer(
//                         child: Container(
//                           height: 140.h,
//                           width: 135.h,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Failed To Load Image",
//                                 style: GoogleFonts.montserrat(
//                                   color: primaryText,
//                                   fontSize: 10.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         height: 140.h,
//                         width: 135.h,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: sliderImages.map((image) {
//             return Container(
//               width: 8.0,
//               height: 8.0,
//               margin: EdgeInsets.symmetric(horizontal: 2.0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _current == sliderImages.indexOf(image)
//                     ? Colors.red
//                     : Colors.grey,
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
