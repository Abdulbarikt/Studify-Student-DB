import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class StudentData extends ChangeNotifier {
  getData() {
    User? userId = FirebaseAuth.instance.currentUser;
    final data = FirebaseFirestore.instance
        .collection("notes")
        .where("userId", isEqualTo: userId?.uid)
        .snapshots();
    return data;
  }

  void addData(
    String name,
    String age,
    String email,
    String phone,
    String course,
    String image,
  ) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("notes").doc().set(
      {
        "Name": name,
        "Age": age,
        "Email": email,
        "Phone": phone,
        "course": course,
        "Image": image,
        "userId": currentUser?.uid,
      },
    );
  }



  void upDatedata(
    final studentId,
    TextEditingController name,
    TextEditingController email,
    TextEditingController age,
    TextEditingController phone,
    TextEditingController course,
  ) {
    final CollectionReference userdata =
        FirebaseFirestore.instance.collection('notes');
    final data = {
      'Name': name.text,
      'Age': age.text,
      'Email': email.text,
      'Phone': phone.text,
      'course': course.text,
    };
    userdata.doc(studentId).update(data);
  }

  final students = FirebaseFirestore.instance.collection('notes');
  void delete(docid) {
    students.doc(docid).delete();
  }
  String imageUrl = 'aa';
  void addToStorage(File image) async {
    String fileName = const Uuid().v1();
    final storageRef = FirebaseStorage.instance.ref();

    TaskSnapshot uploadTask =
        await storageRef.child('profile_images').child(fileName).putFile(image);
    imageUrl = await uploadTask.ref.getDownloadURL();
    notifyListeners();
  }
  File? imageFile;

  void imagePicker() async {
    final imagePicker = ImagePicker();
    try {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile!.path);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
