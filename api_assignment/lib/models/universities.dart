// http://universities.hipolabs.com/search?country=India
// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);

import 'dart:convert';

class University {
  University({
    required this.country,
    required this.domains,
    required this.webPages,
    required this.alphaTwoCode,
    required this.name,
    required this.stateProvince,
  });

  final String country;
  final List<String> domains;
  final List<String> webPages;
  final String alphaTwoCode;
  final String name;
  final String stateProvince;

  factory University.fromRawJson(String str) =>
      University.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory University.fromJson(Map<String, dynamic> json) => University(
        country: json["country"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        name: json["name"],
        stateProvince: json["state-province"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "alpha_two_code": alphaTwoCode,
        "name": name,
        "state-province": stateProvince,
      };
}
