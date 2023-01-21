// import 'dart:convert';
//
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
//
// import '../../customs/colors.dart';
// import '../../customs/ontapscale.dart';
// import '../components/mytickets.dart';
//
// class EventsPage extends StatefulWidget {
//   EventsPage({Key? key}) : super(key: key);
//
//   @override
//   State<EventsPage> createState() => _EventsPageState();
// }
//
// class _EventsPageState extends State<EventsPage> {
//   var data2 = 'RY - ASASASDADASDADQ21';
//   List<Map<String, dynamic>> _events = []; // Initialize with an empty list
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchEvents();
//   }
//
//   Future<List<Map<String, dynamic>>> _fetchEvents() async {
//     final response = await http.get(Uri.parse('http://10.0.2.2:5000/events'));
//     if (response.statusCode == 200) {
//       return List<Map<String, dynamic>>.from(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load events');
//     }
//   }
//
//   //
//   @override
//   Widget build(BuildContext context) {
//     ScrollController _scrollController = new ScrollController();
//
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: scaffoldBackground,
//         body: CustomScrollView(
//           slivers: [
//             // SliverAppBar(
//             //   expandedHeight: 0,
//             //   title: FadeIn(
//             //     child: Text(
//             //       "Our Events",
//             //       style: GoogleFonts.montserrat(
//             //         color: Colors.white,
//             //         fontSize: 21.sp,
//             //         fontWeight: FontWeight.bold,
//             //       ),
//             //     ),
//             //   ),
//             //   centerTitle: true,
//             //   automaticallyImplyLeading: false,
//             //   elevation: 0,
//             //   pinned: true,
//             //   floating: false,
//             //   stretch: true,
//             //   surfaceTintColor: const Color(0xffF9F9F9),
//             //   backgroundColor: scaffoldBackground,
//             // ),
//             SliverFillRemaining(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 14.h, right: 14.h),
//                       child: CustomTap(
//                         onTap: () {},
//                         child: Container(
//                           margin: EdgeInsets.only(top: 2.h),
//                           height: 42.h,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: const Color(0x21ffffff),
//                               borderRadius: BorderRadius.circular(7.r)),
//                           child: Padding(
//                             padding: EdgeInsets.all(8.0.h),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   FontAwesomeIcons.magnifyingGlass,
//                                   color: const Color(0x37ffffff),
//                                   size: 18.sp,
//                                 ),
//                                 SizedBox(
//                                   width: 10.w,
//                                 ),
//                                 Text(
//                                   "Search events by name",
//                                   style: GoogleFonts.montserrat(
//                                     color: const Color(0x37ffffff),
//                                     fontSize: 15.sp,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 06.h,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Registered Events",
//                             style: GoogleFonts.montserrat(
//                               color: primaryText,
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     MyTickets(data2: data2),
//                     Padding(
//                       padding: EdgeInsets.all(10.0.h),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Explore",
//                             style: GoogleFonts.montserrat(
//                               color: const Color(0xffFFFFFF),
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.h, right: 10),
//                       child: FutureBuilder(
//                         future: _fetchEvents(),
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             List<Map<String, dynamic>> events =
//                                 snapshot.data ?? [];
//                             return ListView.builder(
//                               itemCount: events.length,
//                               itemBuilder: (context, index) {
//                                 final event = events[index];
//                                 return CustomTap(
//                                   onTap: () {},
//                                   child: Card(
//                                     color: cardBackground,
//                                     elevation: 0,
//                                     clipBehavior: Clip.antiAlias,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(13)),
//                                     child: Column(
//                                       children: [
//                                         Stack(
//                                           children: [
//                                             Ink.image(
//                                               image: AssetImage(
//                                                 event['image'],
//                                               ),
//                                               child: const InkWell(),
//                                               height: 240.h,
//                                               fit: BoxFit.cover,
//                                             ),
//                                             const Positioned(
//                                                 top: 10,
//                                                 right: 10,
//                                                 child: CircleAvatar(
//                                                   radius: 26,
//                                                   backgroundColor: Colors.white,
//                                                   child: CircleAvatar(
//                                                     radius: 22.0,
//                                                     backgroundImage: NetworkImage(
//                                                         'https://api.vitap.app/next_logo.png'),
//                                                     backgroundColor:
//                                                     Colors.transparent,
//                                                   ),
//                                                 )),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               top: 16.h,
//                                               left: 15.h,
//                                               right: 15.h),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 event['title'],
//                                                 style: GoogleFonts.montserrat(
//                                                   color: primaryText,
//                                                   fontSize: 15.sp,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 event['subtitle'],
//                                                 style: GoogleFonts.montserrat(
//                                                   color: secondaryText,
//                                                   fontSize: 9.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                 EdgeInsets.only(top: 4.h),
//                                                 child: Text(
//                                                   event['description'],
//                                                   style: GoogleFonts.montserrat(
//                                                     color: secondaryText,
//                                                     fontSize: 13.sp,
//                                                     fontWeight:
//                                                     FontWeight.normal,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(height: 2.h),
//                                         ButtonBar(
//                                           alignment: MainAxisAlignment.start,
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {},
//                                                 child: Text(
//                                                   "View",
//                                                   style: GoogleFonts.montserrat(
//                                                     color: lightPurple,
//                                                     fontSize: 13.sp,
//                                                     fontWeight:
//                                                     FontWeight.normal,
//                                                   ),
//                                                 )),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           } else if (snapshot.hasError) {
//                             return Center(
//                               child: Text("Error: ${snapshot.error}"),
//                             );
//                           } else {
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Row(
// children: [
// Text(
// "Explore",
// style: GoogleFonts.montserrat(
// color: const Color(0xffFFFFFF),
// fontSize: 18.sp,
// fontWeight: FontWeight.w400,
// ),
// ),
// ],
// ),
