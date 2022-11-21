import 'package:api_assignment/models/universities.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversityNotifier extends ChangeNotifier {
  SharedPreferences? _prefs;
  final String uniKey = "universities";
  List _universities = [];
  bool _connectionState = true;

  bool get connectionState => _connectionState;

  UniversityNotifier() {
    _loadFromPrefs();
  }

  List get universities => _universities;

  set universities(List unis) {
    _universities = unis;
    _saveToPrefs();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  Future<List> getUniversities() async {
    const String url = "http://universities.hipolabs.com/search?country=India";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Failed to load universities');
    }
  }

  Future<bool> checkConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  _loadFromPrefs() async {
    await _initPrefs();
    bool hasConnection = await checkConnection();

    if (hasConnection) {
      _universities = await getUniversities();
      _connectionState = hasConnection;
      _saveToPrefs();
    } else {
      _universities = jsonDecode(_prefs!.getString(uniKey)!);
    }

    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setString(uniKey, jsonEncode(_universities));
    notifyListeners();
  }
}
