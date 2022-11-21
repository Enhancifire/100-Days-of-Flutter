import 'package:api_assignment/models/users.dart';
import 'package:api_assignment/utils/database/db.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataNotifier extends ChangeNotifier {
  final String nameKey = "userName";
  final String ageKey = "userAge";
  final String imageKey = "userImage";
  SharedPreferences? _prefs;
  String _name = "";
  String _age = "";
  String _imageURL = "";

  UserDataNotifier() {
    _loadFromPrefs();
  }

  logout() async {
    _name = "";
    _age = "";
    _imageURL = "";
    _saveToPrefs();
  }

  login() async {
    await _loadFromPrefs();
    _saveToPrefs();
  }

  String get name => _name;

  set name(String param) {
    _name = param;
    notifyListeners();
  }

  String get age => _age;

  set age(String param) {
    _age = param;
    notifyListeners();
  }

  String get imageURL => _imageURL;

  Future<bool> checkConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  set imageURL(String param) {
    _imageURL = param;
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    DB db = DB();
    FirebaseUser user = await db.getUserData();

    await _initPrefs();
    bool hasConnection = await checkConnection();
    if (hasConnection) {
      _name = user.name;
      _age = user.age;
      _imageURL = user.imagePath;
      _saveToPrefs();
    } else {
      _name = _prefs!.getString(nameKey) ?? "";
      _age = _prefs!.getString(ageKey) ?? "";
      _imageURL = _prefs!.getString(imageKey) ?? "";
    }
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setString(nameKey, _name);
    _prefs!.setString(ageKey, _age);
    _prefs!.setString(imageKey, _imageURL);
  }
}
