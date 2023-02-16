import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/ShoppingPage/GenerateQRLogic/generate_qr.dart';

import 'GenerateInvoiceLogic/invoice_v2.dart';

class InvoicePage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final invoice;
  final product;
  InvoicePage({Key? key, required this.invoice, required this.product})
      : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  String? generatedPdfFilePath;

  @override
  void initState() {
    super.initState();
    generateExampleDocument();
    _getOrderStatus();
    _timer = Timer.periodic(Duration(seconds: 9), (timer) {
      print("Timmer Done");
      _getOrderStatus();
    });
  }

  Future<void> generateExampleDocument() async {
    final user = FirebaseAuth.instance.currentUser!;
    final htmlContent = """
  <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>
  <body>
    <div class="col-sm-8 col-md-8 col-md-offset-2" id="receiptPrint">
      <div class="box box-solid">
        <div class="box-header" align="center">
          <div align="center">
            <img border="0" class="row col-md-4" src="https://vtop2.vitap.ac.in/vtop/assets/img/New%20logo.png" width="190" height="100" style="float: none;">
          </div>
        </div>
        <div class="box-body ">
          <div style="height: 10px;"></div>
          <table class="table noborder">
            <tbody>
              <tr>
                <th style="font-weight: bold; font-size: 12px; padding: 1px !important;">Receipt Number</th>
                <td style="font-size: 12px; padding: 1px !important;">${widget.invoice['ORDERID']}</td>
                <th style="font-weight: bold; font-size: 12px; padding: 1px !important;">Name</th>
                <td style="font-size: 12px; padding: 1px !important;">${user.displayName.toString()}</td>
              </tr>
              <tr>
                <th style="font-weight: bold; font-size: 12px; padding: 1px !important;"> Receipt Date</th>
                <td style="font-size: 12px; padding: 1px !important;">${widget.invoice['TXNDATE']}</td>
                <th style="font-weight: bold; font-size: 12px; padding: 1px !important;">Registered Email</th>
                <td style="font-size: 12px; padding: 1px !important;">${user.email.toString()}</td>
              </tr>
              <tr>
                <th style="font-weight: bold; font-size: 12px; padding: 1px !important;">Campus</th>
                <td style="font-size: 12px; padding: 1px !important;">AMARAVATI</td>
              </tr>
              
              </tr> 
            </tbody>
          </table>
          <hr>
          <div style="font-weight: bold; font-size: 15px; text-decoration: underline; " class="text text-primary text-center">VITOPIA - MERCHANDISE</div>
          <div style="font-weight: bold; font-size: 15px; " class="text text-primary text-center"></div>
          <table class="table">
            <thead>
              <tr>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">S.No</th> 
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">SKU</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Bank TXN ID</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Description</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Invoice Remarks</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important; float: right;">Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style=" font-weight: bold; font-size: 12px; padding: 1px !important;" class="col-md-1">1</td>
                <td class="col-md-1" style=" font-size: 12px; padding: 1px !important;">${widget.product['SKU']}</td> 
                <td class="col-md-1" style=" font-size: 12px; padding: 1px !important;">${widget.invoice['BANKTXNID']}</td>
                <td style=" font-size: 12px; padding: 1px !important;" class="col-md-4">${widget.product['name']}</td>
                <td style=" font-size: 12px; padding: 1px !important;" class="col-md-4">VITOPIA2023-MARCH</td>
                <td style=" font-size: 12px; padding: 1px !important; float: right;" class="col-md-5 text-right">${widget.invoice['TXNAMOUNT']}</td>
              </tr>
            </tbody>
          </table>
          <div style="font-weight: bold; font-size: medium; " class="text text-primary text-right">Grand Total : </div>
        
          <table class="table">
            <thead>
              <tr>
                <th class="text-center" colspan="4" style="font-weight: bold; font-size: 15px; text-decoration: underline;">Payment Details</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Payment Mode</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Bank Name</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Bank Transaction Id.</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;" class="text-right">Amount</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;" class="text-right">Remarks</th>
              </tr>
              <tr>
                <td style=" font-size: 12px; padding: 1px !important;">${widget.invoice['PAYMENTMODE']}</td>
                <td style=" font-size: 12px; padding: 1px !important;">${widget.invoice['BANKNAME']}</td>
                <td style=" font-size: 12px; padding: 1px !important;">${widget.invoice['BANKTXNID']}</td>
                <td style=" font-size: 12px; padding: 1px !important;" class="text-right">${widget.invoice['TXNAMOUNT']}</td>
                <td style=" font-size: 12px; padding: 1px !important;" class="text-right">
                  <div></div>
                </td>
              </tr>
              <tr>
                <th class="text-center" colspan="4" style="font-weight: bold; font-size: 15px">This is computer generated invoice signature is not required</th>
              </tr>
            </tbody>
          </table>
          <div></div>
        </div>
  </body>
</html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    final targetFileName = "VITOPIA_${widget.invoice['BANKTXNID']}";

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
  }

  late final AnimationController _controller;

  String _status = 'WAITING';
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
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
    setState(() {
      // updating the state
    });
    final user = FirebaseAuth.instance.currentUser!;
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
                        widget.invoice['TXNAMOUNT'],
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
                        widget.invoice['TXNDATE'],
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
                        "Bank Transaction Id",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffBCBCBC),
                        ),
                      ),
                      Text(
                        widget.invoice['BANKTXNID'],
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
                        "Payment Status",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffBCBCBC),
                        ),
                      ),
                      if (widget.invoice['STATUS'] == 'TXN_SUCCESS')
                        Text(
                          "Success",
                          style: GoogleFonts.montserrat(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                          ),
                        )
                      else
                        Text(
                          'Pending - Please Contact Support',
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
            if (_status == 'waiting')
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
                      Row(
                        children: [
                          CustomTap(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => QrAcceptanceDialog(
                                  invoice: widget.invoice,
                                  product: widget.product,
                                ),
                              );
                            },
                            child: Container(
                              height: 75.h,
                              width: 75.h,
                              child: Icon(
                                Icons.qr_code_scanner,
                                size: 70.sp,
                                color: Color(0xff7636F6),
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(3, 3),
                                      spreadRadius: -11,
                                      blurRadius: 50,
                                      color: Color.fromRGBO(118, 54, 246, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Color(0xff1C1C1C)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.w),
                            width: 190.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Take-Away QR",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xffBCBCBC),
                                  ),
                                ),
                                Text(
                                  "Tap on the Qr to Generate the Code",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            else
              Column(
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
                          Row(
                            children: [
                              Container(
                                height: 75.h,
                                width: 75.h,
                                child: Icon(
                                  Icons.done,
                                  size: 50.sp,
                                  color: Color(0xff39FF65),
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(3, 3),
                                        spreadRadius: -19,
                                        blurRadius: 44,
                                        color:
                                            Color.fromRGBO(24, 249, 76, 0.69),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: Color(0xff1C1C1C)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20.w),
                                width: 190.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Take-Away",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xffBCBCBC),
                                      ),
                                    ),
                                    Text(
                                      "You Have Picked your Product",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                          "Name",
                          style: GoogleFonts.montserrat(
                            color: Color(0xffBCBCBC),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          user.displayName.toString(),
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
                        Container(
                          width: 190.h,
                          child: Text(
                            user.email.toString(),
                            overflow: TextOverflow.clip,
                            maxLines: 5,
                            style: GoogleFonts.montserrat(
                              color: Color(0xffBCBCBC),
                              fontWeight: FontWeight.w300,
                              fontSize: 15.sp,
                            ),
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
                              'Pickup Details will be Sent via Mail show the QR Code to Avail the pickup',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xffffffff), fontSize: 14.sp),
                            ),
                            Text(
                              'VITOPIA -Team NExT',
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
                        Container(
                          width: 180.h,
                          child: Text(
                            widget.product['name'],
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.montserrat(
                              color: Color(0xffBCBCBC),
                              fontWeight: FontWeight.w300,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        Text(
                          widget.product['price'],
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Size: ${widget.invoice['SIZE']}',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      widget.product['SKU'],
                      style: GoogleFonts.montserrat(
                        color: Color(0xffBCBCBC),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              child: Text('Generate PDF'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PDFScreen(path: generatedPdfFilePath)),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

class QrAcceptanceDialog extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final invoice;
  final product;
  QrAcceptanceDialog({Key? key, required this.invoice, required this.product})
      : super(key: key);

  @override
  State<QrAcceptanceDialog> createState() => _QrAcceptanceDialogState();
}

class _QrAcceptanceDialogState extends State<QrAcceptanceDialog> {
  bool _accepted = false;
  TextEditingController qr_instructions = TextEditingController();
  @override
  void initState() {
    super.initState();
    qr_instructions.text = "test";
  }

  @override
  void dispose() {
    qr_instructions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    qr_instructions.text = "Make Sure you Don't Share your QR with Anyone";

    return AlertDialog(
      title: Text(
        'Generate QR',
        style: GoogleFonts.montserrat(
          color: Color(0xff151515),
          fontWeight: FontWeight.w800,
          fontSize: 15.sp,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Please accept the terms and conditions to proceed',
            style: GoogleFonts.montserrat(
              color: Color(0xff151515),
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
          TextFormField(
            enabled: false,

            minLines: 1,
            maxLines: 5, // allow user to enter 5 line in textfield
            keyboardType: TextInputType
                .multiline, // user keyboard will have a button to move cursor to next line
            controller: qr_instructions,
          ),
          CheckboxListTile(
            value: _accepted,
            onChanged: (bool? value) {
              setState(() {
                _accepted = value!;
              });
            },
            title: Text('Accept'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Proceed'),
          onPressed: _accepted
              ? () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => GenerateQrScreen(
                                invoice: widget.invoice,
                                product: widget.product,
                              )));
                }
              : null,
        ),
      ],
    );
  }
}
