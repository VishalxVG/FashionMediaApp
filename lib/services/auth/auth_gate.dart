import 'package:fashion_app/pages/homePage.dart';
import 'package:fashion_app/services/auth/login_or_Register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user loged in
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
