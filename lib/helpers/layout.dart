import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/screens/InformationPage/information_page.dart';
import 'package:vitopia/screens/home/student_home.dart';

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
      extendBody: false,
      body: pages[_selectedPage],
      bottomNavigationBar: Container(
        height: 60.h,
        child: BottomNavigationBar(
            elevation: 18,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            enableFeedback: true,
            currentIndex: _selectedPage,
            selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 9.5.sp,
              fontWeight: FontWeight.w400,
            ),
            selectedItemColor: Color(0xff040507),
            unselectedItemColor: Color(0xffCFD4D5),
            selectedFontSize: 10.sp,
            unselectedFontSize: 10.sp,
            iconSize: 25.sp,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
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
        icon: Icon(FluentIcons.info_20_filled),
        label: 'Attendance',
      ),
      const BottomNavigationBarItem(
        icon: Icon(FluentIcons.person_20_filled),
        label: 'You',
      ),
    ];
  }
}
