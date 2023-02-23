import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitopia/customs/colors.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/profilePage/payment_policy.dart';

import '../provider/google_sign_in.dart';
import 'components/accountDeletion.dart';
import 'components/contactus_page.dart';
import 'data_privacy.dart';

class ProfileV2 extends StatelessWidget {
  const ProfileV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      var url = Uri.parse('https://vitap.app');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: const Color(0xff010101),
        appBar: AppBar(
          backgroundColor: const Color(0xff010101),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          title: FadeIn(
            child: Text('PROFILE',
                style: TextStyle(
                  fontFamily: 'Monument Extended',
                  color: const Color(0xffFFFFFF),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Container(
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              opacity: 0.4,
                              image: AssetImage('assets/images/pattern.png'),
                              fit: BoxFit.cover),
                          color: const Color(0x13737373),
                          borderRadius: BorderRadius.circular(18.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi 👋🏻',
                                  style: GoogleFonts.montserrat(
                                    color: primaryText,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Hero(
                                  tag: 'profile_name',
                                  child: Container(
                                    width: 200.w,
                                    child: Text(
                                      user.displayName ?? "User",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: primaryText,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 9.h),
                            child: Hero(
                              tag: "PROFILE",
                              child: CircleAvatar(
                                radius: 38.r,
                                backgroundColor: const Color(0xfffffff),
                                child: CircleAvatar(
                                  radius: 30.r,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: user.photoURL ??
                                          "https://vitopia.mukham.in/images/vitopiauser.jpg",
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => Shimmer(
                                        child: Container(
                                          height: 25.h,
                                          width: 25.h,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        height: 140.h,
                                        width: 135.h,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.h),
                        child: CustomTap(
                          onTap: () {
                            Navigator.of(context).pushNamed('/profileview');
                          },
                          child: Container(
                            height: 90.h,
                            width: 130.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0x21737373),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Entypo.user,
                                  size: 28.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 05.h,
                                ),
                                Text(
                                  "My Profile",
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xffFFFFFF),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: CustomTap(
                          onTap: () {
                            Navigator.of(context).pushNamed('/orders');
                          },
                          child: Container(
                            height: 90.h,
                            width: 130.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0x21737373),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Entypo.bag,
                                  size: 28.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 05.h,
                                ),
                                Text(
                                  "Orders",
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xffFFFFFF),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 14.h),
                    child: Row(
                      children: [
                        Text(
                          "Application",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xffFFFFFF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/developersview');
                    },
                    title: Text(
                      "Developers",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "know your developers",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff727272),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCECECE),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.developer_mode,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => DataPrivacy()));
                    },
                    title: Text(
                      "Data privacy",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "user agreement",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff727272),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCECECE),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.privacy_tip_outlined,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => PaymentPolicy()));
                    },
                    title: Text(
                      "Payment Policy",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "Refund/Payment Policies",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff727272),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCECECE),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.currency_rupee,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AccountDeletionDialog(
                            userEmail: user.email.toString(),
                            deletionPeriodInDays: 7,
                          );
                        },
                      );
                    },
                    title: Text(
                      "Account Deletion",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "Process to Delete your Account",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff727272),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCECECE),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.warning,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await Share.share(
                          'Hey, Now VITOPIA App is Available for Both IOS and Android Check it now and Register the PROSHOWS and Enjoy the Event. Download it now https://vitopia.vitap.ac.in'
                          // 'https://apps.apple.com/in/app/vitap-university-student-app/id6443920958'
                          );
                    },
                    title: Text(
                      "Share with friends",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "share your experience",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff727272),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCECECE),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.ios_share,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showAboutDialog(
                          context: context,
                          applicationIcon: Image.asset(
                            'assets/images/vitap_logo.png',
                            width: 30.w,
                          ),
                          applicationLegalese: 'V1.0.0',
                          applicationName: 'VITOPIA',
                          applicationVersion: 'ARIZE');
                    },
                    title: Text(
                      "Software License",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "Legal Software License",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff727272),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCECECE),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.perm_device_info_outlined,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ContactUs()));
                    },
                    title: Text(
                      "Contact Us",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "Help",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff727272),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCECECE),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.mail_outline,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CustomTap(
                    onTap: _launchURL,
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Container(
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                opacity: 0.9,
                                image: AssetImage(
                                    'assets/images/gradient-img.jpg'),
                                fit: BoxFit.cover),
                            color: const Color(0x13737373),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Checkout Our Other Apps',
                                    style: GoogleFonts.montserrat(
                                      color: primaryText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'From',
                                        style: GoogleFonts.montserrat(
                                          color: primaryText,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        ' Team NExT',
                                        style: GoogleFonts.montserrat(
                                          color: primaryText,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 9.h),
                                child: Image.asset(
                                    'assets/images/vitap-mockup.png')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: CustomTap(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: AlertDialog(
                                  title: const Text("Leaving to Soon!"),
                                  content: const Text(
                                      "Are sure you want to logout?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("NO")),
                                    TextButton(
                                        onPressed: () {
                                          final provider =
                                              Provider.of<GoogleSignInProvider>(
                                                  context,
                                                  listen: false);
                                          provider.logout(
                                              context, Navigator.pushNamed);
                                        },
                                        child: const Text("YES")),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 40.h,
                        width: 140.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Logout",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff000000),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                    ),
                  ),
                  Text(
                    "© 2023 Team NExT",
                    style: GoogleFonts.montserrat(
                      color: const Color(0xffBDB9B9),
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "version 1.0.0+9",
                    style: GoogleFonts.montserrat(
                      color: const Color(0xff727272),
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
