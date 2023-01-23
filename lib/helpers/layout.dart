import 'package:animate_do/animate_do.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/screens/InformationPage/information_page.dart';
import 'package:vitopia/screens/home/student_home.dart';

import '../customs/colors.dart';
import '../screens/events/events_page.dart';
import '../screens/profilePage/profile_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedPage = 0;

  final List<Widget> pages = [
    StudentHome(),
    EventsPage(),
    InformationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
        width: 45.h,
        height: 45.h,
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
          tooltip: 'Scan QR Code',
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xffD3D7D8),
          onPressed: () {
            Navigator.of(context).pushNamed('/shop');
          },
          child: FadeIn(
            child: Center(
                child: Icon(
              FontAwesomeIcons.shoppingBag,
              size: 23.sp,
            )),
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
      body: pages[_selectedPage],
      bottomNavigationBar: Container(
        height: 60.h,
        child: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: bottomNavigation,
              showSelectedLabels: true,
              enableFeedback: true,
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
              onTap: _onItemTapped,
              items: _navBarsItems()),
        ),
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
        icon: Icon(FluentIcons.reward_24_filled),
        label: 'Mentions',
      ),
      const BottomNavigationBarItem(
        icon: Icon(FluentIcons.person_20_filled),
        label: 'You',
      ),
    ];
  }
}
