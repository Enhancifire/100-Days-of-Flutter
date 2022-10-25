import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[80],
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[400],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
