import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/colors.dart';

class ProfileV2 extends StatelessWidget {
  const ProfileV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        backgroundColor: scaffoldBackground,
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
        title: Text('PROFILE',
            style: TextStyle(
              fontFamily: 'Monument Extended',
              color: const Color(0xffFFFFFF),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.4,
                        image: AssetImage('assets/images/pattern.png'),
                        fit: BoxFit.cover),
                    color: Color(0xff2D2B30),
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
                          Text(
                            'Satyanand',
                            style: GoogleFonts.montserrat(
                              color: primaryText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 9.h),
                      child: CircleAvatar(
                        radius: 38.r,
                        backgroundColor: Color(0xfffffff),
                        child: CircleAvatar(
                          radius: 30.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              user.photoURL ?? "",
                              height: 110.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Rewards",
                style: GoogleFonts.montserrat(
                  color: const Color(0xffCECECE),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "view your rewards and unlock new ones",
                style: GoogleFonts.montserrat(
                  color: const Color(0xffCECECE),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffCECECE),
              ),
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_bag,
                  color: Color(0xffCECECE),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Rewards",
                style: GoogleFonts.montserrat(
                  color: const Color(0xffCECECE),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "view your rewards and unlock new ones",
                style: GoogleFonts.montserrat(
                  color: const Color(0xffCECECE),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffCECECE),
              ),
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_bag,
                  color: Color(0xffCECECE),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
