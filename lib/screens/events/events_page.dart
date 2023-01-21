import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:vitopia/screens/events/events_view.dart';

import '../../customs/colors.dart';
import '../../customs/ontapscale.dart';
import '../components/mytickets.dart';

class EventsPage extends StatefulWidget {
  EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  var data2 = 'RY - ASASASDADASDADQ21';
  List<Map<String, dynamic>> _events = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<List<Map<String, dynamic>>> _fetchEvents() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/events'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load events');
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: Column(
              children: [
                Container(
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 10.h),
                    // width: 350.w,
                    //  padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0x23FFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.search, color: Colors.grey),
                          Expanded(
                            child: TextField(
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              // textAlign: TextAlign.center,
                              decoration: InputDecoration.collapsed(
                                hintStyle: GoogleFonts.montserrat(
                                  color: const Color(0x37ffffff),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Search by Event Name',
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 13.h)
              ],
            ),
          ),
          title: FadeIn(
            child: Text(
              "Our Events",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 21.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          surfaceTintColor: const Color(0xffF9F9F9),
          backgroundColor: scaffoldBackground,
        ),
        backgroundColor: scaffoldBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Registered Events",
                      style: GoogleFonts.montserrat(
                        color: primaryText,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              MyTickets(data2: data2),
              Padding(
                padding: EdgeInsets.all(10.0.h),
                child: Row(
                  children: [
                    Text(
                      "Explore",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFFFF),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: FutureBuilder(
                  future: _fetchEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Map<String, dynamic>> events = snapshot.data ?? [];
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 14.h, right: 14.h),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          final event = events[index];
                          return CustomTap(
                            onTap: () {},
                            child: Card(
                              color: cardBackground,
                              elevation: 0,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Hero(
                                        tag: event['image'],
                                        child: Ink.image(
                                          image: NetworkImage(
                                            event['image'],
                                          ),
                                          child: const InkWell(),
                                          height: 240.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Positioned(
                                          top: 10,
                                          right: 10,
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 22.0,
                                              backgroundImage: NetworkImage(
                                                  'https://api.vitap.app/next_logo.png'),
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 16.h, left: 20.h, right: 1.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event['title'],
                                          style: GoogleFonts.montserrat(
                                            color: primaryText,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          event['subtitle'],
                                          style: GoogleFonts.montserrat(
                                            color: secondaryText,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.h),
                                          child: Text(
                                            event['description'],
                                            style: GoogleFonts.montserrat(
                                              color: secondaryText,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EventsViewPage()));
                                          },
                                          child: Text(
                                            "View",
                                            style: GoogleFonts.montserrat(
                                              color: lightPurple,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
