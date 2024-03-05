import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileProvider extends ChangeNotifier {
  String name = '';
  String email = '';

  Future<void> getUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
            .instance
            .collection("Users")
            .doc(currentUser.uid)
            .get();
        if (userData.exists) {
          name = userData.get('name');
          email = userData.get('email');
          notifyListeners();
        }
      }
    } catch (error) {
      print('Error retrieving user data: $error');
    }
  }
}
