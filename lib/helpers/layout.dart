import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/customs/colors.dart';
import 'package:vitopia/screens/TicketShop/ticket_shop.dart';
import 'package:vitopia/screens/home/student_home.dart';

import '../screens/InformationPage/special_mentions.dart';
import '../screens/events/events_page.dart';

class Layout extends StatefulWidget {
  final int index;
  Layout({super.key, required this.index});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedPage = 0;
  List<Widget> pages = [
    StudentHome(),
    EventsPage(),
    TicketShop(),
    InformationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = widget.index;
    });
  }

  @override
  void initState() {
    setState(() {
      _selectedPage = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
        width: 50.h,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 1),
                spreadRadius: -8,
                blurRadius: 23,
                color: Color.fromRGBO(223, 193, 255, 1),
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffA863F0),
                  Color(0xffA169DC),
                  Color(0xff4C207D)
                ]),
            color: Color(0xff7636F6)),
        child: FloatingActionButton.small(
          elevation: 7,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xffD3D7D8),
          onPressed: () {
            Navigator.of(context).pushNamed('/shop');
          },
          child: Padding(
            padding: EdgeInsets.only(right: 5.h),
            child: Icon(
              FontAwesome5.tshirt,
              size: 18.sp,
            ),
          ),
        ),
      ),
      // FloatingActionButton(
      //   shape: CircleBorder(
      //     //<-- SEE HERE
      //     side: BorderSide(
      //       width: 0.4,
      //       color: Color(0xff9E49F8),
      //     ),
      //   ),
      //   onPressed: () {
      //     Navigator.of(context).pushNamed('/shop');
      //   },
      //   child: const Icon(Icons.refresh),
      // ),
      body: pages.elementAt(_selectedPage),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: scaffoldBackground,
            showSelectedLabels: true,
            enableFeedback: false,
            currentIndex: _selectedPage,
            selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 9.5.sp,
              fontWeight: FontWeight.w400,
            ),
            selectedItemColor: Color(0xffDFC1FF),
            unselectedItemColor: Color(0xffCFD4D5),
            selectedFontSize: 10.sp,
            unselectedFontSize: 10.sp,
            iconSize: 25.sp,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: _navBarsItems()),
      ),
    );
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(FluentIcons.home_20_filled),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(FluentIcons.calendar_empty_20_filled),
        label: 'Events',
      ),
      const BottomNavigationBarItem(
        icon: Icon(FluentIcons.ticket_diagonal_16_filled),
        label: 'Tickets',
      ),
      const BottomNavigationBarItem(
        icon: Icon(FluentIcons.reward_24_filled),
        label: 'Mentions',
      ),
    ];
  }
}
