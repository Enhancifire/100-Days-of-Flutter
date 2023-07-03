import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
          child: Text("Home Page"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go("/chat");
          },
          child: const Icon(Icons.chat),
        ));
  }
}
