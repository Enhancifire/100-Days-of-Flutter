import 'dart:convert';
import 'package:comicon/models/char_model.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIFetcher {
  late final String ts;
  final String public = "00c3bf048abe7c99ef4555d07ad795df";
  final String private = "0b250125359dfb0b0f92ebac6a1d6fb08d27b4f3";
  late final String hash;
  final String url = "http://gateway.marvel.com";
  late final String params;

  final Map<String, String> endpoints = {
    "characters": "v1/public/characters",
  };

  APIFetcher() {
    ts = "12";
    hash = md5.convert(utf8.encode('$ts$private$public')).toString();
    params = "ts=$ts&apikey=$public&hash=$hash";
  }

  Future<List> getCharacters() async {
    final response = await http.get(
      Uri.parse("$url/${endpoints["characters"]}?$params"),
    );
    final data = jsonDecode(jsonEncode((response.body)));
    List characters = data["data"]["results"];
    return characters;
  }
}
