import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DisabledPage extends StatelessWidget {
  const DisabledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'see you Again',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
