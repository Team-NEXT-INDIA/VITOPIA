import 'dart:async';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../customs/colors.dart';
import '../../customs/ontapscale.dart';
import 'InvoicePage.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List _orders = [];
  List _product = [];

  @override
  void initState() {
    super.initState();
    _fetchOrders();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {});
    });
  }

  Future<List<dynamic>> _fetchOrders() async {
    final user = FirebaseAuth.instance.currentUser!;
    final String _myorders = "http://216.48.191.15:1080/orders";
    final response = await http.post(Uri.parse(_myorders),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': user.email}));

    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        _orders =
            (json.decode(response.body) as Map<String, dynamic>)['orders'];
        _product =
            (json.decode(response.body) as Map<String, dynamic>)['products'];
      });
      return _orders;
    } else {
      throw Exception('Failed to load orders');
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
        title: FadeIn(
          child: Text(
            'My Orders',
            style: TextStyle(
              fontFamily: 'Monument Extended',
              color: Color(0xffFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: _orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.9,
                    child: SvgPicture.asset(
                      'assets/images/no-order.svg',
                      width: 190.w,
                    ),
                  ),
                  Text(
                    'No Orders Found',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _fetchOrders,
              child: ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.h),
                    child: CustomTap(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => InvoicePage(
                              invoice: _orders[index],
                              product: _product[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0x484A4646),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              child: CachedNetworkImage(
                                imageUrl: _product[index]['image'],
                                height: 110.h,
                                width: 100.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Shimmer(
                                  child: Container(
                                    height: 140.h,
                                    width: 135.h,
                                    color: Colors.grey,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Failed To Load Image",
                                          style: GoogleFonts.montserrat(
                                            color: primaryText,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  height: 140.h,
                                  width: 135.h,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.h),
                            Container(
                              width: 200.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _product[index]['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  if (_orders[index]['OUT_STATUS'] == 'waiting')
                                    Text(
                                      'Ready for Pickup',
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  else
                                    Text(
                                      'Pickup Done',
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  Text(
                                    _product[index]['price'],
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.montserrat(
                                        color: const Color(0xff39FF65),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
