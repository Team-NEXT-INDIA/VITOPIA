import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataPrivacyPage extends StatelessWidget {
  const DataPrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
        title: Text(
          'PRIVACY POLICY',
          style: TextStyle(
              fontFamily: 'Monument Extended',
              fontSize: 23.sp,
              color: Color(0xffffffff)),
        ),
      ),
    );
  }
}
