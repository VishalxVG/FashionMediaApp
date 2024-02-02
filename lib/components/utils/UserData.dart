import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String email;
  final String photoUrl;
  final String userName;
  final String uid;

  UserData({
    required this.userName,
    required this.email,
    required this.uid,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        "username": userName,
        "email": email,
        "uid": uid,
        "PhotoUrl": photoUrl,
      };

  static UserData fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return UserData(
      userName: snap["username"],
      email: snap["email"],
      uid: snap["uid"],
      photoUrl: snap["photoUrl"],
    );
  }
}
