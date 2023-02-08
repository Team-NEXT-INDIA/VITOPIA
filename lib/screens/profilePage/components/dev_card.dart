import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../customs/ontapscale.dart';

class DevCardBuild extends StatelessWidget {
  final String name;
  final String image;
  final String instagramlink;
  final String linkedinlink;

  DevCardBuild({
    Key? key,
    required this.name,
    required this.image,
    required this.instagramlink,
    required this.linkedinlink,
  }) : super(key: key);

  _launchURLInsta() async {
    var url = Uri.parse(instagramlink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLLinkedIn() async {
    var url = Uri.parse(linkedinlink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: () {
        _dialogBuilder(context);
      },
      child: SizedBox(
        height: 110.h,
        width: 20.w,
        child: Card(
          color: Color(0xff1C1C1C),
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Ink.image(
                  //
                  //   child: InkWell(),
                  //   height: 140.h,
                  //   fit: BoxFit.cover,
                  // ),
                  Image.asset(
                    image,
                    height: 160.h,
                    width: 300.w,
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //     top: 10,
                  //     right: 10,
                  //     child: CircleAvatar(
                  //       radius: 26,
                  //       backgroundColor: Colors.white,
                  //       child: CircleAvatar(
                  //         radius: 22.0,
                  //         backgroundImage: NetworkImage(
                  //             'https://api.vitap.app/next_logo.png'),
                  //         backgroundColor: Colors.transparent,
                  //       ),
                  //     )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 16.h, left: 10.h, right: 15.h, bottom: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xff292929),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    image,
                    height: 140.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0x20c9c9c9),
                    child: IconButton(
                      onPressed: _launchURLInsta,
                      icon: Icon(FontAwesomeIcons.instagram),
                      color: Colors.white70,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0x20c9c9c9),
                    child: IconButton(
                      onPressed: _launchURLLinkedIn,
                      icon: Icon(FontAwesomeIcons.linkedinIn),
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
