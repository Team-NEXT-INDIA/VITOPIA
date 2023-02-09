import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vitopia/customs/ontapscale.dart';

class PaymentSucess extends StatefulWidget {
  final String currency;
  final String gatewayname;
  final String respmsg;
  final String bankname;
  final String paymentmode;
  final String mid;
  final String respcode;
  final String txnid;
  final String orderid;
  final String status;
  final String banktxnid;
  final String txndate;
  final String checksumhash;
  final String txnamount;
  final String SKU;

  PaymentSucess(
      {required this.currency,
      required this.gatewayname,
      required this.respmsg,
      required this.bankname,
      required this.paymentmode,
      required this.mid,
      required this.respcode,
      required this.txnid,
      required this.orderid,
      required this.status,
      required this.banktxnid,
      required this.txndate,
      required this.checksumhash,
      required this.txnamount,
      required this.SKU});

  @override
  State<PaymentSucess> createState() => _PaymentSucessState();
}

class _PaymentSucessState extends State<PaymentSucess>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 0,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(
          //     Icons.arrow_back_ios_new,
          //     color: Colors.white,
          //   ),
          // ),
          centerTitle: true,
          title: const Text(
            "ORDER SUCCESS",
            style: TextStyle(
              fontFamily: 'Monument Extended',
              color: Color(0xffFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeIn(
                child: Lottie.asset(
                  'assets/lottie/sucess.json',
                  repeat: true,
                  width: double.infinity,
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    _controller
                      ..repeat(period: Duration(minutes: 2))
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
              Text(
                "Order Confirmed",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                indent: 40.h,
                endIndent: 40.h,
                height: 4.h,
                thickness: 2.h,
                color: Color(0x99444444),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Amount Paid",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '₹ ${widget.txnamount}',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Transaction Date: ${widget.txndate}',
                style: GoogleFonts.montserrat(
                    color: Color(0xff8B8B8B), fontSize: 12.sp),
              ),
              Text(
                'Transaction ID: ${widget.txnid}',
                style: GoogleFonts.montserrat(
                    color: Color(0xff8B8B8B), fontSize: 9.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.all(10.h),
                child: viewInvoice(),
              ),
              Padding(
                padding: EdgeInsets.all(10.h),
                child: gotoshop(),
              ),

              // SizedBox(
              //   height: 15.h,
              // ),
            ],
          ),
        ));
  }
}

class viewInvoice extends StatelessWidget {
  const viewInvoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .popAndPushNamed('/studenthome');
        Navigator.pushNamed(context, '/orders');
      },
      child: Container(
        height: 45.h,
        width: 290.w,
        decoration: BoxDecoration(
            border: Border.all(width: 0.9.h, color: Colors.white),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "View Orders",
              style: GoogleFonts.montserrat(
                  color: Color(0xffffffff),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}

class gotoshop extends StatelessWidget {
  const gotoshop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .popAndPushNamed('/studenthome');
        Navigator.pushNamed(context, '/shop');
      },
      child: Container(
        height: 45.h,
        width: 290.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Go to Shop",
              style: GoogleFonts.montserrat(
                  color: Color(0xff000000),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
