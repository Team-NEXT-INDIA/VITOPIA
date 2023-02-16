import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/customs/ontapscale.dart';

import '../../customs/colors.dart';
import '../ShoppingPage/Data/product_data_class.dart';
import '../ShoppingPage/FollowPages/Failed_Payment.dart';
import '../ShoppingPage/FollowPages/Sucess_Payment.dart';
import '../provider/google_sign_in.dart';

class Ticket_view extends StatefulWidget {
  Ticket_view({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<Ticket_view> createState() => _Ticket_viewState();
}

class _Ticket_viewState extends State<Ticket_view> {
  final user = FirebaseAuth.instance.currentUser!;
  bool _starttransaction = false;
  final String _successbaseUrl = "http://216.48.191.15:1080/save-transaction";
  final String _failedbaseUrl =
      "http://216.48.191.15:1080/save-failed-transaction";
  Future<http.Response> postTransactionDetails(transactionDetails) async {
    Map<String, dynamic> successResponse =
        json.decode(json.encode(transactionDetails));
    String CURRENCY = successResponse['CURRENCY'] ?? "";
    String GATEWAYNAME = successResponse['GATEWAYNAME'] ?? "";
    String RESPMSG = successResponse['RESPMSG'] ?? "";
    String BANKNAME = successResponse['BANKNAME'] ?? "";
    String PAYMENTMODE = successResponse['PAYMENTMODE'] ?? "";
    String MID = successResponse['MID'] ?? "";
    String RESPCODE = successResponse['RESPCODE'] ?? "";
    String TXNID = successResponse['TXNID'] ?? "";
    String ORDERID = successResponse['ORDERID'] ?? "";
    String STATUS = successResponse['STATUS'] ?? "";
    String BANKTXNID = successResponse['BANKTXNID'] ?? "";
    String TXNDATE = successResponse['TXNDATE'] ?? "";
    String CHECKSUMHASH = successResponse['CHECKSUMHASH'] ?? "";
    String TXNAMOUNT = successResponse['TXNAMOUNT'] ?? "";
    String SKU = widget.product.sku ?? "";
    String OUT_STATUS = 'waiting';
    Map<String, dynamic> body = {
      'CURRENCY': CURRENCY,
      'GATEWAYNAME': GATEWAYNAME,
      'RESPMSG': RESPMSG,
      'BANKNAME': BANKNAME,
      'PAYMENTMODE': PAYMENTMODE,
      'MID': MID,
      'RESPCODE': RESPCODE,
      'TXNID': TXNID,
      'ORDERID': ORDERID,
      'STATUS': STATUS,
      'BANKTXNID': BANKTXNID,
      'TXNDATE': TXNDATE,
      'CHECKSUMHASH': CHECKSUMHASH,
      'TXNAMOUNT': TXNAMOUNT,
      'SKU': SKU,
      'OUT_STATUS': OUT_STATUS,
    };
    final response = await http.post(
      Uri.parse(
        _successbaseUrl,
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> postFailedTransactionDetails(transactionDetails) async {
    final response = await http.post(
      Uri.parse(
        _failedbaseUrl,
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(transactionDetails),
    );
    return response;
  }

  // Function to save the transaction details to the database
  void saveOrders(
      {required txnAmount,
      required orderId,
      required paymentMode,
      required txnDate,
      required sku,
      required email}) async {
    try {
      // Create the request body with the transaction details
      Map<String, dynamic> body = {
        "ORDERID": orderId,
        "TXNAMOUNT": txnAmount,
        "PAYMENTMODE": paymentMode,
        "TXNDATE": txnDate,
        "SKU": sku,
        "EMAIL": user.email,
      };

      // convert the body to json string
      var jsonBody = jsonEncode(body);

      // Make the API call
      final response = await http.post(
          Uri.parse(
            'http://216.48.191.15:1080/save-order',
          ),
          headers: {"Content-Type": "application/json"},
          body: jsonBody);

      if (response.statusCode == 200) {
        // The API call was successful
        print("ORDER Transaction saved successfully!");
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 20.h),
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
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image ?? "",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer(
                          child: Container(
                            width: double.infinity,
                            color: Colors.black87,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(0),
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name ?? "",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xffffffff),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.product.sub_category ?? "-",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff909090),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₹ ${widget.product.price.toString()}',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff39FF65),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTap(
                          onTap: () {
                            setState(() {
                              _starttransaction = true;
                            });
                            FocusScope.of(context).requestFocus(FocusNode());
                            String amount = widget.product.price.toString();
                            Future.delayed(const Duration(seconds: 3));
                            if ((!(user.email ?? '')
                                    .endsWith('@vitapstudent.ac.in') &&
                                !(user.email ?? '').endsWith('@vitap.ac.in'))) {
                              setState(() {
                                _starttransaction = false;
                              });
                              _dialogBuilder(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "User Not Authorised with VITAP Credentials"),
                                ),
                              );
                              return;
                            }
                            initiateTransaction(amount);
                          },
                          child: Container(
                            height: 40.h,
                            width: 130.h,
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: _starttransaction
                                  ? const CupertinoActivityIndicator()
                                  : Text(
                                      'Buy Ticket',
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xff000000),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
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
                    widget.product.sub_category.toString(),
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
                widget.product.description.toString(),
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

  void initiateTransaction(String amount) async {
    Map<String, dynamic> body = {
      'amount': amount,
      'reg_no': user.email ?? "",
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "vitopia.mukham.in", // my ip address , localhost
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
        false,
        false,
      ).then((value) {
        //  on payment completion we will verify transaction with transaction verify api
        //  after payment completion we will verify this transaction
        //  and this will be final verification for payment
        Map<String, dynamic> jsonResponse = json.decode(json.encode(value));
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
        String SKU = widget.product.sku ?? "";
        Map<String, dynamic> body = {
          'CURRENCY': CURRENCY,
          'GATEWAYNAME': GATEWAYNAME,
          'RESPMSG': RESPMSG,
          'BANKNAME': BANKNAME,
          'PAYMENTMODE': PAYMENTMODE,
          'MID': MID,
          'RESPCODE': RESPCODE,
          'TXNID': TXNID,
          'ORDERID': ORDERID,
          'STATUS': STATUS,
          'BANKTXNID': BANKTXNID,
          'TXNDATE': TXNDATE,
          'CHECKSUMHASH': CHECKSUMHASH,
          'TXNAMOUNT': TXNAMOUNT,
        };
        postTransactionDetails(body);
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Order Success"),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        print("SAVING ORDERS TO DB");

        saveOrders(
          email: user.email,
          txnAmount: TXNAMOUNT,
          orderId: ORDERID,
          paymentMode: PAYMENTMODE,
          txnDate: TXNDATE,
          sku: SKU,
        );
        print("ENDING SAVING ORDERS TO DB");
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

        String CURRENCY = transactionDetails['CURRENCY'] ?? "";
        String GATEWAYNAME = transactionDetails['GATEWAYNAME'] ?? "NGW";
        String RESPMSG = transactionDetails['RESPMSG'] ?? "";
        String BANKNAME = transactionDetails['BANKNAME'] ?? "";
        String PAYMENTMODE = transactionDetails['PAYMENTMODE'] ?? "";
        String MID = transactionDetails['MID'] ?? "";
        String RESPCODE = transactionDetails['RESPCODE'] ?? "";
        String TXNID = transactionDetails['TXNID'] ?? "";
        String ORDERID = transactionDetails['ORDERID'] ?? "";
        String STATUS = transactionDetails['STATUS'] ?? "";
        String BANKTXNID = transactionDetails['BANKTXNID'] ?? "";
        String TXNDATE = transactionDetails['TXNDATE'] ?? "";
        String CHECKSUMHASH = transactionDetails['CHECKSUMHASH'] ?? "";
        String SKU = widget.product.sku ?? "";
        String TXNAMOUNT = transactionDetails['TXNAMOUNT'] ?? "";
        print("FAILED MESSAGE");
        Map<String, dynamic> failbody = {
          'CURRENCY': CURRENCY,
          'GATEWAYNAME': GATEWAYNAME,
          'RESPMSG': RESPMSG,
          'BANKNAME': BANKNAME,
          'PAYMENTMODE': PAYMENTMODE,
          'MID': MID,
          'RESPCODE': RESPCODE,
          'TXNID': TXNID,
          'ORDERID': ORDERID,
          'STATUS': STATUS,
          'BANKTXNID': BANKTXNID,
          'TXNDATE': TXNDATE,
          'CHECKSUMHASH': CHECKSUMHASH,
          'TXNAMOUNT': TXNAMOUNT,
        };
        postFailedTransactionDetails(failbody);
        print(transactionDetails);
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Order Failed"),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        "vitopia.mukham.in", // my ip address , localhost
        "paytmphp/verify_transaction.php", // let's check verifycation code on backend
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    // var verifyJson = jsonDecode(res.body);
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
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Not Authorised",
                style: GoogleFonts.montserrat(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 230.w,
                child: Text(
                  'To ensure that only VITAP University users have access to purchase Tickets, authentication with a valid VITAP University email will be required to Buy Tickets.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: CustomTap(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              title: const Text("Leaving to Soon!"),
                              content:
                                  const Text("Are sure you want to logout?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("NO")),
                                TextButton(
                                    onPressed: () {
                                      final provider =
                                          Provider.of<GoogleSignInProvider>(
                                              context,
                                              listen: false);
                                      provider.logout(
                                          context, Navigator.pushNamed);
                                    },
                                    child: const Text("YES")),
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 40.h,
                    width: 140.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Logout",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        );
      },
    );
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
