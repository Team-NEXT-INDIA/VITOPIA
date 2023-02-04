import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../../customs/pdfviewer/full_pdf_viewer_scaffold.dart';

class InvoicePage extends StatefulWidget {
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
    final htmlContent = """
    <!DOCTYPE html>
    <html>
      <head>
        <style>
        table, th, td {
          border: 1px solid black;
          border-collapse: collapse;
        }
        th, td, p {
          padding: 5px;
          text-align: left;
        }
        </style>
      </head>
      <body>
        <h2>PDF Generated with flutter_html_to_pdf plugin</h2>
        
        <table style="width:100%">
          <caption>Sample HTML Table</caption>
          <tr>
            <th>Month</th>
            <th>Savings</th>
          </tr>
          <tr>
            <td>January</td>
            <td> ${widget.invoice['TXNAMOUNT']}</td>
          </tr>
          <tr>
            <td>February</td>
            <td>50</td>
          </tr>
        </table>
        
        <p>Image loaded from web</p>
        <img src="https://i.imgur.com/wxaJsXF.png" alt="web-img">
      </body>
    </html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    final targetFileName = "example-pdf";

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
                      builder: (context) => PDFViewerScaffold(
                          appBar: AppBar(title: Text("Generated PDF Document")),
                          path: generatedPdfFilePath ?? "")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
