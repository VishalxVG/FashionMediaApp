import 'package:fashion_app/components/utils/UserData.dart';
import 'package:fashion_app/services/auth/authServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends ChangeNotifier {
  UserData? _user;

  final AuthServices _authServices = AuthServices();

  UserData? get getUser => _user;

  Future<void> refreshUser() async {
    print("refresh user is called");
    UserData userData = await _authServices.getUserData();
    _user = userData;
    notifyListeners();
  }
}
