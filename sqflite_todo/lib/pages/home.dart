// ignore_for_file: prefer_final_fields, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sqflite_todo/pages/components/task_tile.dart';
import "package:collection/collection.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _values = [
    {
      "title": "Get Groceries",
      "desc": "What the title implies",
      "value": true,
    },
    {
      "title": "IP Assignment",
      "desc": "What the title implies",
      "value": true,
    },
    {
      "title": "DAA Assignment",
      "desc": "What the title implies",
      "value": true,
    }
  ];

  changeValue(int index, bool value) {
    setState(() {
      _values[index]["value"] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xFF304D6D),
      body: ListView(
        children: _values
            .mapIndexed((e, val) => TaskTile(
                  value: val["value"],
                  index: e,
                  func: changeValue,
                  title: val["title"],
                  desc: val["desc"],
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
