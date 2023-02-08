import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

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
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Invoice No</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Description</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important;">Invoice Remarks</th>
                <th style=" font-weight: bold; font-size: 12px; padding: 1px !important; float: right;">Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style=" font-weight: bold; font-size: 12px; padding: 1px !important;" class="col-md-1">1</td>
                <td class="col-md-1" style=" font-size: 12px; padding: 1px !important;">${widget.product['SKU']}</td> 
                <td class="col-md-1" style=" font-size: 12px; padding: 1px !important;">${widget.invoice['TXNID']}</td>
                <td style=" font-size: 12px; padding: 1px !important;" class="col-md-4">${widget.product['name']}</td>
                <td style=" font-size: 12px; padding: 1px !important;" class="col-md-4">VITOPIA2023-MARCH</td>
                <td style=" font-size: 12px; padding: 1px !important; float: right;" class="col-md-5 text-right">${widget.invoice['TXNAMOUNT']}</td>
              </tr>
            </tbody>
          </table>
          <div style="font-weight: bold; font-size: medium; " class="text text-primary text-right">Grand Total : </div>
          <div style="font-weight: bold;  text-align: right;" class="text">k</div>
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

  @override
  Widget build(BuildContext context) {
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
                        "TXN Status",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffBCBCBC),
                        ),
                      ),
                      Text(
                        widget.invoice['STATUS'],
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
                        Text(
                          user.email.toString(),
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
                          widget.product['name'],
                          style: GoogleFonts.montserrat(
                            color: Color(0xffBCBCBC),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
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
          ],
        ),
      ),
    );
  }
}
