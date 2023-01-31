import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vitopia/customs/colors.dart';

import '../provider/google_sign_in.dart';
import 'components/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //
            expandedHeight: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.h),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              title: Text("Leaving to Soon!"),
                              content: Text("Are sure you want to logout?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("NO")),
                                TextButton(
                                    onPressed: () {
                                      final provider =
                                          Provider.of<GoogleSignInProvider>(
                                              context,
                                              listen: false);
                                      provider.logout(
                                          context, Navigator.pushNamed);
                                    },
                                    child: Text("YES")),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Icon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    color: Colors.white,
                    size: 23.sp,
                  ),
                ),
              ),
            ],
            title: FadeIn(
              child: Text(
                "Account",
                style: GoogleFonts.montserrat(
                  color: primaryText,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w800,
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
            backgroundColor: profileAppBar,
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.network(
                        user.photoURL ?? "",
                        height: 100.h,
                      ),
                    ),
                    SizedBox(height: 20),
                    ProfileMenu(
                      text: user.displayName ?? "",
                      press: () => {},
                      title: 'Name',
                    ),
                    ProfileMenu(
                      text: user.tenantId ?? "",
                      press: () {},
                      title: 'User ID',
                    ),
                    ProfileMenu(
                      text: "Internal",
                      press: () {},
                      title: 'Type',
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
