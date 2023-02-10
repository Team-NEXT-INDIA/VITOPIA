import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/screens/InformationPage/mentioncolor.dart';

import '../../customs/ontapscale.dart';
import 'InfoV2/special_mention_data.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  List<SpecialPerson> _specialPersons = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSpecialPersons();
  }

  void _fetchSpecialPersons() async {
    final String _specials = "http://216.48.191.15:1080/special-mentions";
    final response = await http.get(Uri.parse(_specials));
    if (response.statusCode == 200) {
      print(response.body);
      final specialPersons = (json.decode(response.body) as List)
          .map((personJson) => SpecialPerson.fromJson(personJson))
          .toList();
      setState(() {
        _specialPersons = specialPersons;
        _isLoading = false;
      });
    } else {
// Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: mscaffoldBackground,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 0,
              title: FadeIn(
                child: Text(
                  "Honourable Mentions",
                  style: GoogleFonts.montserrat(
                    color: Color(0xffFFFFFF),
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              pinned: true,
              floating: false,
              stretch: true,
              surfaceTintColor: Color(0xffF9F9F9),
              backgroundColor: mscaffoldBackground,
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: _scrollController,
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CategorizedSpecialPersonsList(
                            specialPersons: _specialPersons)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategorizedSpecialPersonsList extends StatelessWidget {
  final List<SpecialPerson> specialPersons;

  CategorizedSpecialPersonsList({required this.specialPersons});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<SpecialPerson>> categorizedSpecialPersons =
        Map.fromIterable(
      specialPersons,
      key: (person) => person.category,
      value: (person) =>
          specialPersons.where((p) => p.category == person.category).toList(),
    );
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: categorizedSpecialPersons.entries.map((entry) {
        final category = entry.key;
        final persons = entry.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(14.h),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 05.h),
                    width: 20.h,
                    height: 02.h,
                    color: Colors.cyan,
                  ),
                  Text(
                    category,
                    style: GoogleFonts.montserrat(
                      color: Color(0xffFFFFFF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: persons
                          .map((person) =>
                              SpecialPersonCard(specialPerson: person))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class SpecialPersonCard extends StatelessWidget {
  final SpecialPerson specialPerson;

  SpecialPersonCard({required this.specialPerson});

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: () {
        _dialogBuilder(context);
      },
      child: SizedBox(
        height: 240.h,
        width: 135.h,
        child: Card(
          color: Color(0xff261F2D),
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Ink.image(
                  //
                  //   child: InkWell(),
                  //   height: 140.h,
                  //   fit: BoxFit.cover,
                  // ),

                  CachedNetworkImage(
                    imageUrl: specialPerson.image,
                    height: 140.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer(
                      child: Container(
                        height: 140.h,
                        width: 135.h,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Text(error.toString()),
                  ),
                  // Positioned(
                  //     top: 10,
                  //     right: 10,
                  //     child: CircleAvatar(
                  //       radius: 26,
                  //       backgroundColor: Colors.white,
                  //       child: CircleAvatar(
                  //         radius: 22.0,
                  //         backgroundImage: NetworkImage(
                  //             'https://api.vitap.app/next_logo.png'),
                  //         backgroundColor:
                  //             Colors.transparent,
                  //       ),
                  //     )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 16.h, left: 10.h, right: 15.h, bottom: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      specialPerson.name,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      specialPerson.designation,
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xff292929),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: specialPerson.image,
                  height: 140.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer(
                    child: Container(
                      height: 140.h,
                      width: 135.h,
                      color: Colors.grey,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                specialPerson.name,
                style: GoogleFonts.montserrat(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
              ),
              Text(
                specialPerson.designation,
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.8, -1),
                    child: Icon(
                      FontAwesome5.quote_left,
                      size: 40.sp,
                      color: Color(0x20c9c9c9),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.8, -1.4),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Icon(
                        FontAwesome5.quote_right,
                        color: Color(0x20c9c9c9),
                        size: 45.sp,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 180.w,
                      child: Text(
                        specialPerson.quote,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Color(0xffc9c9c9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
