import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/colors.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.press,
    required this.title,
  }) : super(key: key);

  final String text, title;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          tileColor: Color(0xff101010),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          title: Text(
            title,
            style: GoogleFonts.montserrat(
              color: primaryText,
              fontSize: 11.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Text(
                text,
                style: GoogleFonts.montserrat(
                  color: secondaryText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ));
  }
}
