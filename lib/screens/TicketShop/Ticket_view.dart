import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Ticket_view extends StatelessWidget {
  const Ticket_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          "TICKET",
          style: TextStyle(
            fontFamily: 'Monument Extended',
            color: Color(0xffFFFFFF),
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130.h,
                    width: 120.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.ibb.co/hD7FHGb/STANDUP-COMEDY.png'),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pro Show',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xffffffff),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Amphi Theatre',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff909090),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₹ 1500',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xffffffff),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 40.h,
                          width: 140.h,
                          decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Center(
                            child: Text(
                              'Buy Ticket',
                              style: GoogleFonts.montserrat(
                                color: Color(0xff000000),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'About Show',
                style: GoogleFonts.montserrat(
                  color: Color(0xbdffffff),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Location :',
                    style: GoogleFonts.montserrat(
                      color: Color(0xffffffff),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    'Amphi Theatre',
                    style: GoogleFonts.montserrat(
                      color: Color(0xbdffffff),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Time :',
                    style: GoogleFonts.montserrat(
                      color: Color(0xffffffff),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    '12:00 PM',
                    style: GoogleFonts.montserrat(
                      color: Color(0xbdffffff),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
                "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
                " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:"
                "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
                "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
                " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:"
                "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
                "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
                " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:"
                "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
                "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
                " For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:",
                style: GoogleFonts.montserrat(
                  color: Color(0xffDBDBDB),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
