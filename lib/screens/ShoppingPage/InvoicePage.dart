import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          'INVOICE SUMMARY',
          style: TextStyle(
            fontFamily: 'Monument Extended',
            color: Color(0xffFFFFFF),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff121212),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Invoice Total",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffBCBCBC),
                        ),
                      ),
                      Text(
                        " ₹1700.00",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Invoice Date",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffBCBCBC),
                        ),
                      ),
                      Text(
                        "2023-01-29",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff121212),
              ),
              child: Padding(
                padding: EdgeInsets.all(25.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Details',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.montserrat(
                            color: Color(0xffBCBCBC),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          'Samuel Philip',
                          style: GoogleFonts.montserrat(
                            color: Color(0xffBCBCBC),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.montserrat(
                            color: Color(0xffBCBCBC),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          'samuel.200@gmail.com',
                          style: GoogleFonts.montserrat(
                            color: Color(0xffBCBCBC),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff121212),
              ),
              child: Padding(
                padding: EdgeInsets.all(25.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup Details',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 400.h,
                      decoration: BoxDecoration(
                          color: Color(0xff1C1C1C),
                          borderRadius: BorderRadius.circular(10.h)),
                      child: Padding(
                        padding: EdgeInsets.all(15.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup at AB-2 office show the receipt to log the pickup',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xffffffff), fontSize: 14.sp),
                            ),
                            Text(
                              '-Team Next Vitopia',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xffffffff), fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff121212),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Items',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Neon T-shirt',
                          style: GoogleFonts.montserrat(
                            color: Color(0xffBCBCBC),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          " ₹1700.00",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'SKU1002',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffBCBCBC),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
