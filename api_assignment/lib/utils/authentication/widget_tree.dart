import 'package:api_assignment/pages/dashboard.dart';
import 'package:api_assignment/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:api_assignment/utils/authentication/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _auth.authState,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginScreen();
          }
        }));
  }
}
