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
          Container(
              height: 100.h,
              width: 100.h,
              child: Image.asset('assets/images/404.jpg')),
          Text(
            'Page not found',
            style: GoogleFonts.montserrat(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xffffffff),
            ),
          )
        ],
      ),
    );
    ;
  }
}
