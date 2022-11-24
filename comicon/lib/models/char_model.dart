/*
id
name
thumbnail:
  path
  extension

*/
import 'dart:convert';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  final int id;
  final String name;
  final String thumbnail;

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        thumbnail:
            "${json["thumbnail"]["path"]}.${json["thumbnail"]["extension"]}",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
      };
}
