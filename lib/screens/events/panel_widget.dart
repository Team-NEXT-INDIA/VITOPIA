import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: <Widget>[
          const SizedBox(height: 36),
          buildAboutText(),
        ],
      );
  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "hello",
              style: (TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 12),
            Text(
                "hsbcdf fjhkxnewuiyhjasdvbcnilxukqhwebyuafjdshNuxhjecvfwqayidwhbcdcnbskhujbwsdvjacebsfyuhjwcbeyhsjab gwrhevsdbuyigwqvfgdushaa"
                "If you have defined the 'event' variable in another file, such as an EventsPage class, you will need to pass it as an argument to the EventsViewPage widget when you create it."
                "                For example, if you have an event variable in an EventsPage class, you could pass it as a named argument to the EventsViewPage constructor:")
          ],
        ),
      );
}
