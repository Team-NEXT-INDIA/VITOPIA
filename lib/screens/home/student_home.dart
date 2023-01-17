import 'package:animate_do/animate_do.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/Intro/Components/featured_events_slider.dart';
import 'package:vitopia/screens/components/mytickets.dart';

import '../Intro/Components/feature_cards.dart';
import 'components/fab.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  ScrollController _scrollController = new ScrollController();
  bool isFAB = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          isFAB = true;
        });
      } else {
        setState(() {
          isFAB = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  var data2 = 'RY - ASASASDADASDADQ21';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          isFAB ? buildFAB(context) : buildExtendedFAB(context),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            collapsedHeight: 2,
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            expandedHeight: 0,
            elevation: 0,
            pinned: true,
            floating: false,
            stretch: true,
            surfaceTintColor: Color(0xffF9F9F9),
            backgroundColor: Colors.white,
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          FadeIn(
                            duration: Duration(milliseconds: 450),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome",
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xffB0B0B0),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Samuel Philip",
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xff202022),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.h),
                                      child: InkWell(
                                        onTap: () {},
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0x25E2E2E2),
                                          radius: 25.r,
                                          child: Icon(
                                            FluentIcons.qr_code_20_regular,
                                            size: 20.sp,
                                            color: const Color(0xffD2D8DA),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 0.h),
                                      child: InkWell(
                                        onTap: () {},
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0x25E2E2E2),
                                          radius: 25.r,
                                          child: Icon(
                                            FluentIcons.person_20_regular,
                                            size: 20.sp,
                                            color: const Color(0xffD2D8DA),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          CustomTap(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(top: 10.h),
                              height: 42.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF7F7F7),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.magnifyingGlass,
                                      color: const Color(0xffD3D7D8),
                                      size: 18.sp,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Search events by name",
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xffD3D7D8),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FadeIn(child: FeaturedEvents()),
                        ],
                      ),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 390),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(left: 10.h),
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const FeatureCards(
                              image: 'assets/images/poster-1.jpg',
                              title: 'Indian Ocean Band is Here!',
                              subtitle: '🎸 Read to Rock ? ',
                            ),
                            const FeatureCards(
                              image: 'assets/images/poster-2.jpg',
                              title: 'International Cultural Fest',
                              subtitle: '⭐️ Dash the dearing',
                            ),
                            const FeatureCards(
                              image: 'assets/images/poster-3.jpeg',
                              title: 'International Cultural Fest',
                              subtitle: '⭐️ Dash the dearing',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Registered Events",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff040507),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyTickets(data2: data2),
                    SizedBox(
                      height: 550.h,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
