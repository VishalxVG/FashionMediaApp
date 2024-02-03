import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/components/utils/post.dart';
import 'package:fashion_app/services/storage/storage.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //*Upload Post
  Future<String> uploadPost(String description, String uid, Uint8List file,
      String username, String profileImage) async {
    String res = "some error occured";

    try {
      String photoUrl =
          await StorageMethod().uploadImageToStorage('Posts', file, true);
      String postId = const Uuid().v1();
      PostData postData = PostData(
        description: description,
        uid: uid,
        userName: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profileImage,
        likes: [],
      );
      _firestore.collection("Posts").doc(postId).set(
            postData.toJson(),
          );
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
