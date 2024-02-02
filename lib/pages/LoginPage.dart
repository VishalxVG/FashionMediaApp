// ignore_for_file: file_names, use_build_context_synchronously

import 'package:fashion_app/services/auth/authServices.dart';
import 'package:flutter/material.dart';

import '../components/UI components/CustomButton.dart';
import '../components/UI components/TextField_Editor.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, this.onTap});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    //* auth services

    final authService = AuthServices();

    // *try login

    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }
    //* catch errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* LOGO

            //TODO : ADD LOGO FOR THE APP

            const SizedBox(
              height: 20,
            ),

            //* TEXT

            Text(
              "Welcome Back",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //* EMAIL TEXT FIELD

            CustomTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),

            const SizedBox(
              height: 20,
            ),

            //* PW TEXT FIELD

            CustomTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),

            //* LOGIN BUTTON

            const SizedBox(
              height: 20,
            ),

            CustomButton(
              ButtonText: "Login",
              ontap: () => login(context),
            ),

            //* REGISTRATION BUTTON

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member ? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
