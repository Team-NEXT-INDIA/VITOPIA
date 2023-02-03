import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ticket_view extends StatelessWidget {
  const Ticket_view({Key? key}) : super(key: key);

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
    );
  }
}
