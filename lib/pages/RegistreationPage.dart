// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';

import 'package:fashion_app/components/UI%20components/CustomButton.dart';
import 'package:fashion_app/components/UI%20components/TextField_Editor.dart';
import 'package:fashion_app/components/utils/pickImage.dart';
import 'package:fashion_app/services/auth/authServices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  Uint8List? _image;

  void register(BuildContext context) async {
    // auth service

    final _auth = AuthServices();

    // password match -> create user

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _auth.signUpWithEmailPassword(
          userNameController.text,
          emailController.text,
          passwordController.text,
          _image!,
        );
      } catch (e) {
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

    // password donot match -> give error

    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "Password Doesnot Match",
          ),
        ),
      );
    }
  }

  //* To pick Profile Image
  void selectedImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            //* LOGO

            //TODO : ADD LOGO

            const SizedBox(
              height: 20,
            ),

            //* Profile Image Selection

            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg",
                        ),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () => selectedImage(),
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //* TEXT

            Text(
              "Lets create a account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //* USER NAME TEXT FIELD

            CustomTextField(
              hintText: "User Name",
              obscureText: false,
              controller: userNameController,
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

            const SizedBox(
              height: 20,
            ),

            //* ConfirmPW TEXT FIELD

            CustomTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: confirmPasswordController,
            ),

            //* REGISTRATION BUTTON

            const SizedBox(
              height: 20,
            ),

            CustomButton(
              ButtonText: "Register",
              ontap: () => register(context),
            ),

            //* LOGIN BUTTON

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member ? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
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
