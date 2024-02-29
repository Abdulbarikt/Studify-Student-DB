import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProvide with ChangeNotifier {
  Future<String> uploadImage() async {
    String imageUrl = '';
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final storageRef =
          FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
      final uploadTask = storageRef.putFile(File(pickedFile.path));
      await uploadTask.whenComplete(() async {
        imageUrl = await storageRef.getDownloadURL();
        notifyListeners();
      });
    }

    return imageUrl;
  }
}
