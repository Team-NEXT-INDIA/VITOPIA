import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/ShoppingPage/FollowPages/Failed_Payment.dart';
import 'package:vitopia/screens/ShoppingPage/FollowPages/Sucess_Payment.dart';

import '../../customs/colors.dart';
import 'Data/product_data_class.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool _starttransaction = false;
  final String _baseUrl = "http://10.0.2.2:8080/transactions";
  Future<http.Response> postTransactionDetails(transactionDetails) async {
    final response = await http.post(
      Uri.parse(
        _baseUrl,
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(transactionDetails),
    );
    print(response);
    return response;
  }

  // Function to save the transaction details to the database
  void saveOrders({
    required txnAmount,
    required orderId,
    required paymentMode,
    required txnDate,
    required SKU,
  }) async {
    try {
      // Create the request body with the transaction details
      Map<String, dynamic> body = {
        "ORDERID": orderId,
        "TXNAMOUNT": txnAmount,
        "PAYMENTMODE": paymentMode,
        "TXNDATE": txnDate,
        "SKU": SKU,
      };

      // Make the API call
      final response = await http.post(
          Uri.parse(
            'http://10.0.2.2:8080/save-order',
          ),
          body: body);

      if (response.statusCode == 200) {
        // The API call was successful
        print("Transaction saved successfully!");
      } else {
        // The API call failed
        print("Error saving transaction: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any errors that occurred during the API call
      print("Error saving transaction: $e");
    }
  }

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
          title: const Text(
            "DETAILS",
            style: TextStyle(
              fontFamily: 'Monument Extended',
              color: Color(0xffFFFFFF),
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.product.image ?? "",
                  height: 450.h,
                  width: double.infinity,
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
                    height: 140.h,
                    width: 135.h,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xFF070707),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, -5),
                            spreadRadius: -12,
                            blurRadius: 29,
                            color: Color.fromRGBO(0, 0, 0, 0.57),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 60,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1a1a1a),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            widget.product.name ?? "",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            widget.product.sub_category ?? "",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFF808080),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            widget.product.SKU ?? "",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFF808080),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            widget.product.description ?? "",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFF808080),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20.h),
                          child: CustomTap(
                            onTap: () {
                              setState(() {
                                _starttransaction = true;
                              });
                              FocusScope.of(context).requestFocus(FocusNode());
                              String amount = widget.product.price.toString();
                              Future.delayed(const Duration(seconds: 3));
                              if (amount.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Error In Payment (0XFF9709)"),
                                  ),
                                );
                                return;
                              }
                              initiateTransaction(amount);
                            },
                            child: Container(
                              height: 40.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _starttransaction
                                      ? const CupertinoActivityIndicator()
                                      : Text(
                                          '\₹ ${widget.product.price}',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ));
  }

  void initiateTransaction(String amount) async {
    Map<String, dynamic> body = {
      'amount': amount,
      'reg_no': 'samuel.21bce7615@gmail.com'
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    print("VERIFY JSON MESSAGE12121231231231231231231231231231");
    print(formData);
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "paytmphp/generate_token.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    // print(res.body);
    // print(res.statusCode);
    if (res.statusCode == 200) {
      print("VERIFY JSON AMOUNT");
      print(res.body);
      var bodyJson = jsonDecode(res.body);

      var response = AllInOneSdk.startTransaction(
        bodyJson['mid'], // merchant id  from api
        bodyJson['orderId'], // order id from api
        amount, // amount
        bodyJson['txnToken'],
        "",
        true,
        false,
      ).then((value) {
        //  on payment completion we will verify transaction with transaction verify api
        //  after payment completion we will verify this transaction
        //  and this will be final verification for payment
        Map<String, dynamic> jsonResponse = json.decode(json.encode(value));
        postTransactionDetails(value);
        String CURRENCY = jsonResponse['CURRENCY'] ?? "";
        String GATEWAYNAME = jsonResponse['GATEWAYNAME'] ?? "";
        String RESPMSG = jsonResponse['RESPMSG'] ?? "";
        String BANKNAME = jsonResponse['BANKNAME'] ?? "";
        String PAYMENTMODE = jsonResponse['PAYMENTMODE'] ?? "";
        String MID = jsonResponse['MID'] ?? "";
        String RESPCODE = jsonResponse['RESPCODE'] ?? "";
        String TXNID = jsonResponse['TXNID'] ?? "";
        String ORDERID = jsonResponse['ORDERID'] ?? "";
        String STATUS = jsonResponse['STATUS'] ?? "";
        String BANKTXNID = jsonResponse['BANKTXNID'] ?? "";
        String TXNDATE = jsonResponse['TXNDATE'] ?? "";
        String CHECKSUMHASH = jsonResponse['CHECKSUMHASH'] ?? "";
        String TXNAMOUNT = jsonResponse['TXNAMOUNT'] ?? "";
        String SKU = widget.product.SKU ?? "";
        print("Saving Orders to database");
        print(widget.product.SKU);
        saveOrders(
          txnAmount: TXNAMOUNT,
          paymentMode: PAYMENTMODE,
          txnDate: TXNDATE,
          orderId: ORDERID,
          SKU: widget.product.SKU,
        );
        print("SUCCESS TRANSACTION");
        Navigator.push(
            context,
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => PaymentSucess(
                currency: CURRENCY,
                gatewayname: GATEWAYNAME,
                respmsg: RESPMSG,
                bankname: BANKNAME,
                paymentmode: PAYMENTMODE,
                mid: MID,
                respcode: RESPCODE,
                txnid: TXNID,
                orderid: ORDERID,
                status: STATUS,
                banktxnid: BANKTXNID,
                txndate: TXNDATE,
                checksumhash: CHECKSUMHASH,
                txnamount: TXNAMOUNT,
                SKU: SKU,
              ),
            ));

        print(value);
        setState(() {
          _starttransaction = false;
        });
        verifyTransaction(bodyJson['orderId']);
      }).catchError((onError) {
        setState(() {
          _starttransaction = false;
        });
        print("FAILED TRANSACTION");

        var transactionDetails = onError.details;
        postTransactionDetails(transactionDetails);
        String CURRENCY = transactionDetails['CURRENCY'] ?? "";
        String GATEWAYNAME = transactionDetails['GATEWAYNAME'] ?? "";
        String RESPMSG = transactionDetails['RESPMSG'] ?? "";
        String BANKNAME = transactionDetails['BANKNAME'] ?? "";
        String PAYMENTMODE = transactionDetails['PAYMENTMODE'] ?? "";
        String MID = transactionDetails['MID'] ?? "";
        String RESPCODE = transactionDetails['RESPCODE'] ?? "";
        String TXNID = transactionDetails['TXNID'] ?? "";
        String ORDERID = transactionDetails['ORDERID'] ?? "";
        String STATUS = transactionDetails['STATUS'] ?? "";
        String BANKTXNID = transactionDetails['BANKTXNID'] ?? "";
        String TXNDATE = transactionDetails['TXNDATE'];
        String CHECKSUMHASH = transactionDetails['CHECKSUMHASH'] ?? "";

        String TXNAMOUNT = transactionDetails['TXNAMOUNT'] ?? "";
        print("FAILED MESSAGE");

        Navigator.push(
            context,
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => PaymentFailed(
                error: RESPMSG,
              ),
            ));
      });
    } else {
      setState(() {
        _starttransaction = false;
      });
      print(res.body);
      Navigator.push(
          context,
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => PaymentFailed(
              error: res.body,
            ),
          ));
    }
  }

  void verifyTransaction(String orderId) async {
    Map<String, dynamic> body = {
      'orderId': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "paytmphp/verify_transaction.php", // let's check verifycation code on backend
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    // print(res.body);
    // print(res.statusCode);
    // json decode
    var verifyJson = jsonDecode(res.body);
    //  display result info > result msg
    print("VERIFY JSON MESSAGE12121231231231231231231231231231");
    print(res.body);

    print(
        "VERIFY JSON MESSAGE ENDS HEREVERIFY JSON MESSAGE12121231231231231231231231231231");
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
