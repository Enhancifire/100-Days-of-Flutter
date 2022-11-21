import 'dart:convert';

import 'package:api_assignment/models/universities.dart';
import 'package:api_assignment/utils/webview/webview_helper.dart';
import 'package:api_assignment/models/university_provider.dart';
import 'package:api_assignment/pages/components/uni_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UniversityPage extends StatefulWidget {
  UniversityPage({super.key});

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          body: value.universities.isNotEmpty
              ? Center(
                  child: ListView.builder(
                    prototypeItem: UniTile(
                      data: const {
                        "country": "India",
                        "domains": ["aaidu.org"],
                        "web_pages": ["http://www.aaidu.org/"],
                        "alpha_two_code": "IN",
                        "name":
                            "Allahabad Agricultural Institute, Deemed University",
                        "state-province": null
                      },
                    ),
                    itemBuilder: ((context, index) {
                      return UniTile(
                        data: value.universities[index] as Map<String, dynamic>,
                      );
                    }),
                    itemCount: value.universities.length,
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
