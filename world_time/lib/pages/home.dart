import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Object? params;
  @override
  Widget build(BuildContext context) {
    params = ModalRoute.of(context)!.settings.arguments;
    data = data.isNotEmpty ? data :jsonDecode(jsonEncode(params));
    print(data);

    String bgImage =
        data['isDaytime'] ? 'assets/images/day.png' : 'assets/images/night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    void changeData(result) {
      setState(() {
        data = {
          'time': result['time'],
          'flag': result['flag'],
          'location': result['location'],
          'isDaytime': result['isDaytime'],
        };
      });
      print(data);
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
		    changeData(result);
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Change Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[300],
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.grey[300],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
