import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class VendorPage extends StatefulWidget {
  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  String qrCodeResult = '';

  Future<void> _scanQRCode() async {
    String? codeScanner;
    try {
      await Permission.camera.request();
      codeScanner = await scanner.scan();
      setState(() {
        qrCodeResult = codeScanner ?? "";
      });
    } on PlatformException catch (e) {
      if (e.code == scanner.CameraAccessDenied) {
        setState(() {
          qrCodeResult = "Camera permission was denied";
        });
      } else {
        setState(() {
          qrCodeResult = "Unknown Error $e";
        });
      }
    } on FormatException {
      setState(() {
        qrCodeResult = "You pressed the back button before scanning anything";
      });
    } catch (e) {
      setState(() {
        qrCodeResult = "Unknown Error $e";
      });
    }
  }

  Future<void> _updateValue(String qrCodeResult) async {
    final String _updationURL =
        "http://216.48.191.15:1080/update_takeaway_status";
    final response = await http.patch(
      Uri.parse(_updationURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"BANKTXNID": qrCodeResult, "OUT_STATUS": "AWAILED"}),
    );

    if (response.statusCode == 200) {
      print('Value updated successfully');
    } else {
      print('Failed to update value');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Result: $qrCodeResult',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _scanQRCode,
              child: Text('Scan QR Code'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: qrCodeResult.isEmpty
                  ? null
                  : () => _updateValue(qrCodeResult),
              child: Text('Update Value'),
            ),
          ),
        ],
      ),
    );
  }
}
