import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../customs/ontapscale.dart';

class FooterPromo extends StatelessWidget {
  const FooterPromo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 233.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.2,
          image: AssetImage("assets/images/cup_bg.png"),
        ),
        color: Color(0xff141313),
      ),
      child: Stack(children: [
        Image.asset(
          'assets/images/cup.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Image.asset(
          'assets/images/gradient.png',
          fit: BoxFit.fitHeight,
          height: 233.h,
          width: double.infinity,
        ),
        Positioned(
          bottom: 30.h,
          right: 40.h,
          left: 40.h,
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Exclusive',
                  style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)),
                  /*defining default style is optional */
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Merchandise \n',
                      style: GoogleFonts.montserrat(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7AE1FF)),
                    ),
                    TextSpan(
                      text: ' Stand out of Crowd',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffBCBCBC)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              CustomTap(
                onTap: () {
                  Navigator.of(context).pushNamed('/shop');
                },
                child: Container(
                  height: 38.h,
                  width: 144.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Center(
                    child: Text(
                      "Buy Merch",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFAFAFA)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
