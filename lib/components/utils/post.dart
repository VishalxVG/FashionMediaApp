import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  final String description;
  final String uid;
  final String userName;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const PostData({
    required this.description,
    required this.uid,
    required this.userName,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "username": userName,
        "postId": postId,
        "datePublished": datePublished,
        "postUrl": postUrl,
        "profImage": profImage,
        "likes": likes,
      };

  static PostData fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return PostData(
      description: snap["description"],
      uid: snap["uid"],
      userName: snap["username"],
      postId: snap["postId"],
      datePublished: snap["datePublished"],
      postUrl: snap["postUrl"],
      profImage: snap["profImage"],
      likes: snap["likes"],
    );
  }
}
