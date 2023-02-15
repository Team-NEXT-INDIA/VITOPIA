import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DisabledPage extends StatelessWidget {
  const DisabledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'VITopia Has Ended Successfully \n Thanks For Participating',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Center(
            child: Row(
              children: [
                Image.asset('assets/images/arize-white.png'),
                Image.asset('assets/images/Logo_white.png')
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
