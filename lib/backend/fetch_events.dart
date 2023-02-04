import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'events_dataclass.dart';

const String url = "http://216.48.191.15:5000/events";

List<VEvents> parseUser(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var events = list.map((e) => VEvents.fromJson(e)).toList();
  return events;
}

Future<List<VEvents>> fetchUsers() async {
  print("trying to fetch API");
  final http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(parseUser, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
