import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../customs/colors.dart';
import 'backend/fetch_events.dart';
import 'events_view.dart';

class EventsPage extends StatefulWidget {
  EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  var data2 = 'RY - ASASASDADASDADQ21';
  var _searchText = '';
  List<Map<String, dynamic>> _events = [];
  //for Hiding the Registered Events widget
  final FocusNode _focusNode = FocusNode();
  EventAPI eventAPI = EventAPI();
  bool _widgetVisible = true;

  @override
  void initState() {
    super.initState();
    eventAPI.fetchEvents();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  List<Map<String, dynamic>> _getFilteredEvents() {
    return eventAPI.events
        .where((event) =>
            event['title'].toString().toLowerCase().contains(_searchText) ||
            event['subtitle'].toString().toLowerCase().contains(_searchText))
        .toList();
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
        resizeToAvoidBottomInset: false,
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
                              focusNode: _focusNode,
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
                              onChanged: (value) {
                                setState(() {
                                  _searchText = value.toLowerCase();
                                });
                              },
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
              Visibility(
                visible: !_focusNode.hasFocus,
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Registered Events",
                    //         style: GoogleFonts.montserrat(
                    //           color: primaryText,
                    //           fontSize: 18.sp,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // MyTickets(data2: data2),
                    // ForYouBuild(),
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: FutureBuilder(
                  future: eventAPI.fetchEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Could not fetch events")));

                        return Center(child: Text("Error: ${snapshot.error}"));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 14.h, right: 14.h),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _getFilteredEvents().length,
                        itemBuilder: (BuildContext context, int index) {
                          final event = _getFilteredEvents()[index];
                          return Card(
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
                                      child: CachedNetworkImage(
                                        imageUrl: event['image'],
                                        height: 240.h,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        placeholder: (context, url) => Shimmer(
                                          child: Container(
                                            height: 140.h,
                                            width: 135.h,
                                            color: Color(0x23FFFFFF),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: CircleAvatar(
                                          radius: 26,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 22.0,
                                            backgroundImage:
                                                NetworkImage(event['avatar']),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 16.h, left: 20.h, right: 1.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
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
                                                      EventsViewPage(
                                                          event:
                                                              _getFilteredEvents()[
                                                                  index])));
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
                          );
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          CupertinoActivityIndicator(
                            color: Colors.white70,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
