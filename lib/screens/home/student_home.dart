import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/events/events_view.dart';

import '../../customs/colors.dart';
import '../Intro/Components/feature_cards.dart';
import 'components/footer_promo.dart';
import 'components/for_you_widget.dart';
import 'featured_viewall.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final user = FirebaseAuth.instance.currentUser!;
  List _featuredEvents = [];
  ScrollController _fabscrollController = new ScrollController();
  ScrollController _ScrollController = new ScrollController();
  bool _isScrolled = false;
  bool isFAB = false;

  @override
  void initState() {
    super.initState();
    _fabscrollController = ScrollController();
    _ScrollController = ScrollController();
    _fetchFeaturedEvents();
    _fabscrollController.addListener(() {
      if (_fabscrollController.offset > 50) {
        setState(() {
          _isScrolled = true;
        });
        setState(() {
          isFAB = true;
        });
      } else {
        setState(() {
          _isScrolled = false;
        });
        setState(() {
          isFAB = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _fabscrollController.dispose();
  }

  var data2 = 'RY - ASASASDADASDADQ21';

  void _fetchFeaturedEvents() async {
    final response =
        await http.get(Uri.parse('http://216.48.191.15:1080/featured-events'));
    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        _featuredEvents = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load featured events');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 01,
//        backgroundColor: Colors.transparent,
        backgroundColor: const Color(0x44000000),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              controller: _fabscrollController,
              child: Stack(children: [
                Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: AnimatedOpacity(
                    opacity: _isScrolled ? 0 : 1,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      height: 570.h,
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            // Color.fromARGB(255, 118, 53, 245),
                            Color(0xFF7635F5),
                            Colors.black
                          ],
                          center: Alignment(-1.0, -1.0),
                          radius: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                // Align(
                //   alignment: AlignmentDirectional(1, 1),
                //   child: Container(
                //     height: 570.h,
                //     decoration: const BoxDecoration(
                //       gradient: RadialGradient(
                //         colors: [
                //           // Color.fromARGB(255, 118, 53, 245),
                //           Color(0xFF7635F5),
                //           Colors.black
                //         ],
                //         center: Alignment(-1.0, -1.0),
                //         radius: 1.0,
                //       ),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: const AlignmentDirectional(-0.91, -0.38),
                  child: Padding(
                    // padding: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              FadeIn(
                                duration: const Duration(milliseconds: 450),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Welcome",
                                          style: GoogleFonts.montserrat(
                                            color: const Color(0xffCECECE),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          user.displayName ?? "",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        // Padding(
                                        //   padding: EdgeInsets.only(right: 5.h),
                                        //   child: InkWell(
                                        //     onTap: () {
                                        //       Navigator.push(
                                        //         context,
                                        //         CupertinoPageRoute(
                                        //             builder: (context) =>
                                        //                 const cameraScreen()),
                                        //       );
                                        //     },
                                        //     borderRadius:
                                        //         BorderRadius.circular(50.r),
                                        //     child: CircleAvatar(
                                        //       backgroundColor:
                                        //           const Color(0x25E2E2E2),
                                        //       radius: 25.r,
                                        //       child: Icon(
                                        //         FluentIcons.qr_code_20_regular,
                                        //         size: 20.sp,
                                        //         color: const Color(0xffD2D8DA),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 0.h),
                                          child: CustomTap(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed('/profile');
                                            },
                                            child: CircleAvatar(
                                              radius: 25.r,
                                              backgroundColor:
                                                  const Color(0x8CFFFFFF),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    const Color(0x25F5EFFF),
                                                radius: 22.r,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        user.photoURL ?? "",
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                    placeholder:
                                                        (context, url) =>
                                                            Shimmer(
                                                      child: Container(
                                                        height: 25.h,
                                                        width: 25.h,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "No Image",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color:
                                                                    primaryText,
                                                                fontSize: 4.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // AnimatedTextField(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // PromoSlider(),
                        FadeIn(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.h),
                          child: Padding(
                            padding: EdgeInsets.only(top: 9.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Featured Events",
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomTap(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                FeatureViewAll(
                                              featuredEvents: _featuredEvents,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color(0xfffffff)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Text(
                                              "See All",
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                        FadeIn(
                          duration: const Duration(milliseconds: 390),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: 10.h,
                            ),
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            child: _featuredEvents.isEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      left: 0.h,
                                      right: 10.h,
                                    ),
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.all(10.h),
                                        alignment: Alignment.center,
                                        height: 200.h,
                                        width: 280.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            color: Color(0x13ffffff)),
                                        child: Text(
                                          'No Featured Events Found',
                                          style: GoogleFonts.montserrat(
                                            color: const Color(0xffFFFFFF),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: _featuredEvents
                                        .map((event) => FeatureCards(
                                              image: event['image'] ?? "",
                                              title: event['title'] ?? "",
                                              subtitle: event['subtitle'] ?? "",
                                              description:
                                                  event['description'] ?? "",
                                              time: event['time'] ?? "",
                                              location: event['location'] ?? "",
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EventsViewPage(
                                                      event: event,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ))
                                        .toList(),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 13.h, top: 8.h, bottom: 10.h),
                          child: Row(
                            children: [
                              Text(
                                "Registered Events",
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xffFFFFFF),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // MyTickets(data2: data2),
                        SizedBox(
                          height: 20.h,
                        ),
                        const ForYouBuild(),
                        SizedBox(
                          height: 10.h,
                        ),
                        const FooterPromo(),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ));
}

class AnimatedTextField extends StatelessWidget {
  const AnimatedTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        height: 42.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: const Color(0x23FFFFFF)),
            color: const Color(0x37FFFFFF),
            borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: const Color(0xf37FFFFFF),
                size: 18.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              AnimatedTextKit(
                pause: const Duration(milliseconds: 200),
                totalRepeatCount: 100,
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText(
                    'Search Events by Name',
                    textStyle: GoogleFonts.montserrat(
                      color: const Color(0xffD3D7D8),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  RotateAnimatedText('Rock Music',
                      textStyle: GoogleFonts.montserrat(
                        color: const Color(0xffD3D7D8),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      )),
                  RotateAnimatedText('Cricket Tournament',
                      textStyle: GoogleFonts.montserrat(
                        color: const Color(0xffD3D7D8),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
