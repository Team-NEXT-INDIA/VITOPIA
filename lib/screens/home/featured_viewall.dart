import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitopia/customs/ontapscale.dart';
import 'package:vitopia/screens/home/components/featured_view_card.dart';

import '../events/events_view.dart';

class FeatureViewAll extends StatelessWidget {
  List featuredEvents = [];

  FeatureViewAll({Key? key, required this.featuredEvents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff000000),
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
          title: Text(
            'Featured Events',
            style: TextStyle(
                fontFamily: 'Monument Extended',
                color: Color(0xffffffff),
                fontSize: 18.sp),
          ),
        ),
        body: ListView.builder(
          itemCount: featuredEvents.length,
          itemBuilder: (context, index) {
            final event = featuredEvents[index];
            return CustomTap(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventsViewPage(
                      event: event,
                    ),
                  ),
                );
              },
              child: FeaturedCard(
                  title: event['title'],
                  subtitle: event['subtitle'],
                  image: event['image']),
            );
          },
        ));
  }
}
