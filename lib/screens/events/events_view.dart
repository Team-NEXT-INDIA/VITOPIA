import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vitopia/screens/events/panel_widget.dart';

class EventsViewPage extends StatefulWidget {
  final Map<String, dynamic> event;
  EventsViewPage({Key? key, required this.event}) : super(key: key);

  @override
  State<EventsViewPage> createState() => _EventsViewPageState();
}

class _EventsViewPageState extends State<EventsViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SlidingUpPanel(
            color: const Color(0xff0A0220),
            minHeight: 332.h,
            maxHeight: 550.h,
            parallaxEnabled: true,
            parallaxOffset: .1,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
            body: Stack(children: [
              Hero(
                tag: widget.event['image'],
                child: CachedNetworkImage(
                  imageUrl: widget.event['image'],
                  fit: BoxFit.cover,
                  height: 325.h,
                  width: double.infinity,
                  placeholder: (context, url) => Shimmer(
                    child: Container(
                      color: const Color(0x23FFFFFF),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ]),
            panelBuilder: (controller) => PanelWidget(
              controller: controller,
              title: widget.event['title'],
              description: widget.event['description'],
              venue: widget.event['venue'],
              start: widget.event['start_time'],
              end: widget.event['end_time'],
              day: widget.event['day'],
              externalurl: widget.event['btn_link'],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, top: 25.h),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white70,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
