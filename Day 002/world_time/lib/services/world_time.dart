import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  final String location; //Location Name for UI
  late String time; // Time for that location
  final String flag; // url for flag image
  final String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Uri uri = Uri.http('worldtimeapi.org', '/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString(); // Set time property
    } catch (e) {
      print(e);
      time = 'Could not get time data';
    }
  }
}
