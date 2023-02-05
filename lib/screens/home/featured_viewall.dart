import 'package:flutter/material.dart';
import 'package:vitopia/screens/events/events_view.dart';

class FeatureViewAll extends StatelessWidget {
  List featuredEvents = [];

  FeatureViewAll({Key? key, required this.featuredEvents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Events'),
      ),
      body: ListView.builder(
        itemCount: featuredEvents.length,
        itemBuilder: (context, index) {
          final event = featuredEvents[index];
          return ListTile(
            title: Text(event['title']),
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
          );
        },
      ),
    );
  }
}
