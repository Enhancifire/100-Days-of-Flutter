import 'package:api_assignment/models/universities.dart';
import 'package:api_assignment/utils/webview/webview_helper.dart';
import 'package:flutter/material.dart';

class UniTile extends StatelessWidget {
  UniTile({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    University uni = University.fromJson(data);

    return Card(
      color: Colors.grey[200],
      elevation: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => Scaffold(
                    body: WebViewHelper(
                      url: uni.webPages.first,
                    ),
                  )),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(uni.name),
              Text(uni.stateProvince),
            ],
          ),
        ),
      ),
    );
  }
}
