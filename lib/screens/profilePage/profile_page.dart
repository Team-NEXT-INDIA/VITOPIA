import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            title: FadeIn(
              child: Text(
                "Account",
                style: GoogleFonts.montserrat(
                  color: const Color(0xff202022),
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
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
            backgroundColor: Colors.white,
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfilePic(),
                    SizedBox(height: 20),
                    ProfileMenu(
                      text: "Samuel Philip",
                      press: () => {},
                      title: 'Name',
                    ),
                    ProfileMenu(
                      text: "21bce7615",
                      press: () {},
                      title: 'Username',
                    ),
                    ProfileMenu(
                      text: "Internal",
                      press: () {},
                      title: 'Type',
                    ),
                    ProfileMenu(
                      text: "Computer Science and Engineering AI/ML",
                      press: () {},
                      title: 'Course',
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
