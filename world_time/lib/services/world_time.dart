import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart';

class WorldTime {
  final String location; //Location Name for UI
  late String time; // Time for that location
  final String flag; // url for flag image
  final String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Uri uri = Uri.http('worldtimeapi.org', '/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'].substring(0, 19);
      DateTime now = DateTime.parse(datetime);
      // now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not get time data';
    }
  }
}
