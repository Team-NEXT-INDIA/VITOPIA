import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../customs/colors.dart';
import '../../customs/ontapscale.dart';
import 'Data/product_data_class.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final user = FirebaseAuth.instance.currentUser!;
  final String _myorders = "http://10.0.2.2:8080/orders";
  Future<List<Product>> getOrders(String email) async {
    final response = await http.post(Uri.parse(_myorders),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': user.email}));
    if (response.statusCode == 200) {
      List<Product> products = (json.decode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
      return products;
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
        title: Text(
          'My Orders',
          style: TextStyle(
            fontFamily: 'Monument Extended',
            color: Color(0xffFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getOrders(user.email ?? ""),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.isEmpty) {
              return Center(
                  child: Text(
                "No orders available",
                style: GoogleFonts.montserrat(color: Colors.white),
              ));
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              List<Product> _products = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.h),
                    child: CustomTap(
                      onTap: () {
                        Navigator.of(context).pushNamed('/invoice_page');
                      },
                      child: Container(
                        height: 150.h,
                        width: 400.h,
                        decoration: BoxDecoration(
                            color: Color(0x484A4646),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CachedNetworkImage(
                                  imageUrl: _products[index].image ?? "",
                                  height: 100.h,
                                  width: 100.h,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Shimmer(
                                    child: Container(
                                      height: 140.h,
                                      width: 135.h,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
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
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Black Vitopia Shirt',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'radium monkey printed',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '₹15000',
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xff39FF65),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
