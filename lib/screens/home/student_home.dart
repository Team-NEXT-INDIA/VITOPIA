import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/Intro/Components/featured_events_slider.dart';
import 'package:vitopia/screens/components/mytickets.dart';

import '../Intro/Components/feature_cards.dart';
import 'components/footer_promo.dart';
import 'components/for_you_widget.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  ScrollController _fabscrollController = new ScrollController();
  ScrollController _ScrollController = new ScrollController();
  bool _isScrolled = false;
  bool isFAB = false;

  @override
  void initState() {
    super.initState();
    _fabscrollController = ScrollController();
    _ScrollController = ScrollController();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 01,
//        backgroundColor: Colors.transparent,
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton:
      //     isFAB ? buildFAB(context) : buildExtendedFAB(context),
      body: CustomScrollView(
        slivers: [
          // const SliverAppBar(
          //   collapsedHeight: 2,
          //   toolbarHeight: 0,
          //   automaticallyImplyLeading: false,
          //   expandedHeight: 0,
          //   elevation: 0,
          //   pinned: true,
          //   floating: false,
          //   stretch: true,
          //
          //   // backgroundColor: Color(0xFF7635F5),
          //   backgroundColor: Colors.transparent,
          // ),
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
                                          "Samuel Philip",
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
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed('/profile');
                                            },
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  const Color(0x25F5EFFF),
                                              radius: 25.r,
                                              child: Icon(
                                                FluentIcons.person_32_filled,
                                                size: 20.sp,
                                                color: const Color(0xffFFFFFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              AnimatedTextField(),
                              FadeIn(child: const FeaturedEvents()),
                            ],
                          ),
                        ),
                        FadeIn(
                          duration: const Duration(milliseconds: 390),
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
                        MyTickets(data2: data2),
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
      ),
    );
  }
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
            border: Border.all(width: 0.5, color: Color(0x23FFFFFF)),
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
                pause: Duration(milliseconds: 200),
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
