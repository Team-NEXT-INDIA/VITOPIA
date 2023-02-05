import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevelopersPage extends StatelessWidget {
  DevelopersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff000000),
        centerTitle: true,
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
          'DEVELOPERS',
          style: TextStyle(
              fontFamily: 'Monument Extended',
              color: Color(0xffffffff),
              fontSize: 23.sp),
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 4.h,
            width: 30.h,
            color: Color(0xff349FD4),
          ),
        ],
      ),
    );
  }
}

class Gridb extends StatefulWidget {
  const Gridb({Key? key}) : super(key: key);

  @override
  State<Gridb> createState() => _GridbState();
}

class _GridbState extends State<Gridb> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "name": "Satyanand",
      "title": "Front Developer",
      "image":
          "https://i.im.ge/2023/01/24/sKSaN6.jacob-nizierski-V0hohwot0oM-unsplash.jpg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
