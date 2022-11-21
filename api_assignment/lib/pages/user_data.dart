import 'dart:convert';

import 'package:api_assignment/models/users.dart';
import 'package:api_assignment/utils/authentication/auth.dart';
import 'package:api_assignment/utils/authentication/widget_tree.dart';
import 'package:api_assignment/utils/database/db.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class UserDataInput extends StatefulWidget {
  const UserDataInput({super.key});

  @override
  State<UserDataInput> createState() => _UserDataInputState();
}

class _UserDataInputState extends State<UserDataInput> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  XFile? _image;
  String _imageURL = "";

  bool _isLoading = false;

  updateUser(email, password) async {
    setState(() {
      _isLoading = true;
    });
    Auth _auth = Auth();
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (_nameController.value != "" && _ageController != "" && _image != null) {
      Reference rootRef = FirebaseStorage.instance.ref();
      Reference refDirImages = rootRef.child('images');
      String filename = DateTime.now().millisecondsSinceEpoch.toString();

      Reference imageRef = refDirImages.child(filename);
      try {
        await imageRef.putFile(File(_image!.path));
        _imageURL = await imageRef.getDownloadURL();
      } catch (e) {}
    }

    var user = FirebaseUser(
        age: _ageController.text,
        name: _nameController.text,
        imagePath: _imageURL);
    DB db = DB();
    db.addUserData(user.toJson());

    Navigator.popUntil(context, ModalRoute.withName('/widget_tree'));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Object? params = ModalRoute.of(context)!.settings.arguments;
    Map data = jsonDecode(jsonEncode(params));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _nameController,
          ),
          TextField(
            controller: _ageController,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final ImagePicker imagePicker = ImagePicker();
              XFile? image =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              _image = image;
            },
            icon: const Icon(Icons.browse_gallery),
            label: const Text('Select Image'),
          ),
          !_isLoading
              ? ElevatedButton(
                  onPressed: () {
                    updateUser(data["email"], data["password"]);
                  },
                  child: const Text('Submit'),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
