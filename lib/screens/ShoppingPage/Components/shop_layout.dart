import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitopia/screens/ShoppingPage/shopping_page.dart';

import '../../../customs/colors.dart';

class ShopLayout extends StatefulWidget {
  const ShopLayout({super.key});

  @override
  _ShopLayoutState createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> {
  int _selectedPage = 0;

  final List<Widget> pages = [ShoppingPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

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
        label: 'Orders',
      ),
    ];
  }
}
