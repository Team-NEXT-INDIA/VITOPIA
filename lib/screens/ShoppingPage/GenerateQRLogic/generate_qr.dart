import 'dart:async';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class GenerateQrScreen extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final invoice;
  final product;
  GenerateQrScreen({
    Key? key,
    required this.invoice,
    required this.product,
  }) : super(key: key);

  @override
  _GenerateQrScreenState createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  String _status = 'WAITING';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _getOrderStatus();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      print("Timmer Done");
      _getOrderStatus();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _getOrderStatus() async {
    final bank_txn_id = widget.invoice['BANKTXNID'];
    final String _generateURL = "http://216.48.191.15:1080/generate-qr";
    final response = await http.post(Uri.parse(_generateURL),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"BANKTXNID": bank_txn_id}));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _status = data['order']['OUT_STATUS'];
      });
    }
  }

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
          'PICKUP',
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            if (_status == 'waiting')
              Container(
                width: 300.w,
                height: 200.h,
                padding: EdgeInsets.all(20.h),
                color: Colors.white,
                child: BarcodeWidget(
                  data: '${widget.invoice['BANKTXNID']}',
                  drawText: false,
                  color: Colors.black,
                  barcode: Barcode.qrCode(typeNumber: 3),
                ),
              )
            else
              Column(
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
                    "You Have Picked your order ",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.product['name']} ",
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        "Sucessfully",
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(
              height: 120.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Status:',
                  style: GoogleFonts.montserrat(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                Text(
                  ' $_status',
                  style: GoogleFonts.montserrat(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              'TXN Id: ${widget.invoice['BANKTXNID']}',
              style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
