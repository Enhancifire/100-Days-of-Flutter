import 'package:alarm_clock/components/arc_reactor.dart';
import 'package:alarm_clock/components/radial_clock.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF441151),
      body: Center(
        child: IronMan(),
      ),
    );
  }
}
