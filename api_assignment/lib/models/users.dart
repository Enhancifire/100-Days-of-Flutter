// To parse this JSON data, do
//     final user = userFromJson(jsonString);

import 'dart:convert';

class FirebaseUser {
  FirebaseUser({
    required this.age,
    required this.name,
    required this.imagePath,
  });

  final String age;
  final String name;
  final String imagePath;

  factory FirebaseUser.fromRawJson(String str) => FirebaseUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirebaseUser.fromJson(Map<String, dynamic> json) => FirebaseUser(
        age: json["age"],
        name: json["name"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "name": name,
        "imagePath": imagePath,
      };
}
