import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //* Adding image to Firebase storage

  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = _firebaseStorage
          .ref()
          .child(childName)
          .child(_auth.currentUser!.uid)
          .child(fileName);

      UploadTask uploadTask = ref.putData(file);

      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error during image upload: $e");
      throw Exception("Error during image upload");
    }
  }
}
