import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Kolkata', flag: 'india.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Berlin', flag: 'uk.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Seoul', flag: 'korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
  ];

  void updateTime(int index) async {
  WorldTime instance = locations[index];
  await instance.getTime();
  // Go back to homescreen
  Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[80],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
		updateTime(index);
		},
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
