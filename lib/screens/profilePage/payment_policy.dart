import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPolicy extends StatelessWidget {
  const PaymentPolicy({Key? key}) : super(key: key);

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
          "PAYMENT POLICY",
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
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Payment Method :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " VITOPIA event app accepts payments made through Paytm gateway only.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Order Processing :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Once an order is placed and payment is confirmed, the Technical Developer Cell will be notified and will process the order for delivery.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Payment Confirmation :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Payment confirmation will be sent to the customer via email or SMS once the payment is processed and approved by the Paytm gateway.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Data Sharing :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Customer's payment information will be shared with the Technical Developer Cell for finance tracking and reconciliation purposes. This information will be kept confidential and will not be shared with any third party.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Responsibility of Customer :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "The customer is responsible for providing accurate and complete payment information. In case of any errors or discrepancies in the payment information, the customer will be responsible for rectifying the same.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Responsibility of "
                "Team Vitopia :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Team VITOPIA will be responsible for ensuring the security of customer's payment information and will take all necessary measures to protect the same.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Changes to Payment Policy :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Team VITOPIA reserves the right to modify this Payment Policy at any time, and the changes will be effective immediately upon posting on the VITOPIA event app.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Refund Policy :",
                style: GoogleFonts.montserrat(
                  color: Color(0xffFFFFFF),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "VITOPIA strives to provide its customers with the highest level of satisfaction. However, in the rare event that a customer raises a dispute regarding a cancellation or refund request, we have a clear policy in place.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Please note that VITOPIA/SDC/VIT-AP does not offer refunds under any circumstances, including instances of misuse such as placing multiple orders on the VTOP website or VITOPIA APP. We have implemented strict measures to prevent such occurrences and to ensure the integrity of our sales process.",
                style: GoogleFonts.montserrat(
                  color: Color(0xffBDB9B9),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
