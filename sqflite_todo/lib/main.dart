import "package:flutter/material.dart";
import "package:sqflite_todo/pages/home.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_todo/providers.dart';
import 'package:sqflite_todo/utils/database/db.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TaskDatabase();
    return MaterialApp(
      title: "Task Manager",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
