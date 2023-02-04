import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/customs/colors.dart';

import 'components/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            expandedHeight: 0,
            title: FadeIn(
              child: Hero(
                tag: 'APP',
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    fontFamily: 'Monument Extended',
                    color: const Color(0xffFFFFFF),
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            pinned: true,
            floating: false,
            stretch: true,
            surfaceTintColor: Color(0xffF9F9F9),
            backgroundColor: Color(0xff000000),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: "PROFILE",
                      child: CircleAvatar(
                        radius: 38.r,
                        backgroundColor: Color(0xfffffff),
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Color(0xfffffff),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: user.photoURL ?? "",
                              width: double.infinity,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Shimmer(
                                child: Container(
                                  height: 25.h,
                                  width: 25.h,
                                  color: Colors.grey,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                height: 140.h,
                                width: 135.h,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "No Image",
                                        style: GoogleFonts.montserrat(
                                          color: primaryText,
                                          fontSize: 4.sp,
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
                    ),
                    SizedBox(height: 20),
                    ProfileMenu(
                      text: user.displayName ?? "",
                      press: () => {},
                      title: 'Name',
                    ),
                    ProfileMenu(
                      text: user.email ?? "",
                      press: () {},
                      title: 'Email',
                    ),
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
