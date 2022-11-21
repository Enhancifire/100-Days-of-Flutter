import 'package:api_assignment/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DB {
  final User? cUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<FirebaseUser> getUserData() async {
    final User? cUser = FirebaseAuth.instance.currentUser;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot doc = await _firestore.collection('users').doc(cUser!.uid).get();

    FirebaseUser us = FirebaseUser.fromJson(doc.data() as Map<String, dynamic>);
    print(us);
    return us;

  }


  Future<void> addUserData(Map<String, dynamic> map) async {
    final User? cUser = FirebaseAuth.instance.currentUser;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    try {
      await users.doc(cUser!.uid).set(map);
    } catch (e) {
      print(e);
    }
  }
}
