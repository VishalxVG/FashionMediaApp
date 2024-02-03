import 'package:fashion_app/components/utils/UserData.dart';
import 'package:fashion_app/services/auth/authServices.dart';
import 'package:flutter/foundation.dart';

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
