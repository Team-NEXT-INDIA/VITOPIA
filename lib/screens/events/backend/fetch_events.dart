import 'dart:convert';

import 'package:http/http.dart' as http;

class EventAPI {
  bool _hasDataBeenFetched = false;
  List<Map<String, dynamic>> _events = [];

  Future<void> fetchEvents() async {
    if (_hasDataBeenFetched) {
      return;
    }
    try {
      final response =
          await http.get(Uri.parse('http://216.48.191.15:1080/events'));
      if (response.statusCode == 200) {
        _hasDataBeenFetched = true;
        print(events);
        _events = List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print(e);
    }
  }

  List<Map<String, dynamic>> get events => _events;
}
