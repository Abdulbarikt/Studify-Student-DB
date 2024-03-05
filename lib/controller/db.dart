import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentData extends ChangeNotifier {
  String email = '';
  String name = '';
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
    String location,
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
        'location': location,
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
    final image,
    String location,
  ) {
    final CollectionReference userdata =
        FirebaseFirestore.instance.collection('notes');
    final data = {
      'Name': name.text,
      'Age': age.text,
      'Email': email.text,
      'Phone': phone.text,
      'course': course.text,
      'Image': image,
      'location': location,
    };
    userdata.doc(studentId).update(data);
  }

  final students = FirebaseFirestore.instance.collection('notes');
  void delete(docid) {
    students.doc(docid).delete();
  }
}
