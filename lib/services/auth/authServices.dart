// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:fashion_app/services/storage/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //* SignIn
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //* Sing Up

  Future<UserCredential> signUpWithEmailPassword(
      String username, email, password, Uint8List profileImage) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      //* Get downloadUrl after uploading the image to storage
      String photoUrl = await StorageMethod()
          .uploadImageToStorage("profilePics", profileImage, false);

      //* Storing  data in firestore cloud database
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
        "username": username,
        "photoUrl": photoUrl,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //* SignOut
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
