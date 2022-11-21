import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Storage {
  Reference rootRef = FirebaseStorage.instance.ref();

  Future<String> uploadImage(XFile? image) async {
    Reference refDirImages = rootRef.child('/images');
    String filename = DateTime.now().millisecondsSinceEpoch.toString();

    Reference imageRef = refDirImages.child(filename);
    String _imageURL = '';

    try {
      await imageRef.putFile(File(image!.path));
      _imageURL = await imageRef.getDownloadURL();
    } catch (e) {}

    return _imageURL;
  }
}
