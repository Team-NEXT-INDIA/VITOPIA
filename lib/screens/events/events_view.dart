import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vitopia/screens/events/panel_widget.dart';

class EventsViewPage extends StatefulWidget {
  const EventsViewPage({Key? key}) : super(key: key);

  @override
  State<EventsViewPage> createState() => _EventsViewPageState();
}

class _EventsViewPageState extends State<EventsViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        body: Image.asset("assets/images/poster-1.jpg"),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
        ),
      ),
    );
  }
}
