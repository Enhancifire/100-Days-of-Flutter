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
    data = jsonDecode(jsonEncode(params));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.location_on_outlined),
                label: Text('Change Location'),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 20,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
