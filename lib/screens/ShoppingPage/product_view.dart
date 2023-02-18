import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/ShoppingPage/FollowPages/Failed_Payment.dart';
import 'package:vitopia/screens/ShoppingPage/FollowPages/Sucess_Payment.dart';

import '../../customs/colors.dart';
import '../provider/google_sign_in.dart';
import 'Data/product_data_class.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
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
    String SIZE = _selectedSize ?? "";
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
      'SIZE': SIZE,
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

  String? _selectedSize;
  bool _sizeSelected = false;
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                Container(
                                  width: 230.w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      widget.product.description ?? "",
                                      maxLines: 2,
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xFF808080),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.h),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(3.h),
                                  child: DropdownButton(
                                    hint: Text("Select Size"),
                                    borderRadius: BorderRadius.circular(18),
                                    value: _selectedSize,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedSize = newValue;
                                        _sizeSelected = true;
                                      });
                                    },
                                    items: [
                                      DropdownMenuItem(
                                        value: "Small",
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(width: 10),
                                            Text(
                                              "Small",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: "Medium",
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(width: 10),
                                            Text(
                                              "Medium",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: "Large",
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(width: 10),
                                            Text(
                                              "Large",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'XL',
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(width: 10),
                                            Text(
                                              "XL",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'XXL',
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(width: 10),
                                            Text(
                                              "XXL",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'XXXL',
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(width: 10),
                                            Text(
                                              "XXXL",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10.h),
                              child: CustomTap(
                                onTap: () {
                                  setState(() {
                                    _starttransaction = true;
                                  });
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  if (!_sizeSelected) {
                                    setState(() {
                                      _starttransaction = false;
                                    });
                                    final snackBar = SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text('Please Select Size'),
                                      action: SnackBarAction(
                                        label: 'Dismiss',
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                        },
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  }

                                  String amount =
                                      widget.product.price.toString();
                                  Future.delayed(const Duration(seconds: 3));

                                  if ((!(user.email ?? '')
                                          .endsWith('@vitapstudent.ac.in') &&
                                      !(user.email ?? '')
                                          .endsWith('@vitap.ac.in'))) {
                                    setState(() {
                                      _starttransaction = false;
                                    });
                                    print(_selectedSize);
                                    _authenticationdialogBuilder(context);
                                    return;
                                  }

                                  initiateTransaction(amount);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40.h,
                                      width: 260.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomTap(
                              onTap: () {
                                _dialogBuilder(context);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 45.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Color(0xffffffff),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svg_chart.svg',
                                          width: 40.w,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
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
        "/paytmphp/generate_token.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(formData);
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
        true,
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
        String SIZE = _selectedSize ?? "";
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
          'SIZE': SIZE,
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
        print(onError);
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
          backgroundColor: Color(0xffffffff),
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
                      icon: Icon(Icons.close)),
                ],
              ),
              Image.asset(
                'assets/images/Sizechart.jpeg',
                fit: BoxFit.contain,
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _authenticationdialogBuilder(BuildContext context) {
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
                  'To ensure that only VITAP University users have access to purchase Merchandise, authentication with a valid VITAP University email will be required to Buy Tickets.',
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
