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
    if (!snapshot.exists || snapshot.data() == null) {
      // Handle the case where the document doesn't exist or data is null
      return UserData(
        userName:
            'DefaultUserName', // Provide default values or throw an exception
        email: 'DefaultEmail',
        uid: 'DefaultUid',
        photoUrl: 'DefaultPhotoUrl',
      );
    }

    var snap = snapshot.data() as Map<String, dynamic>;

    return UserData(
      userName: snap["username"] ?? 'DefaultUserName',
      email: snap["email"] ?? 'DefaultEmail',
      uid: snap["uid"] ?? 'DefaultUid',
      photoUrl: snap["photoUrl"] ?? 'DefaultPhotoUrl',
    );
  }
}
