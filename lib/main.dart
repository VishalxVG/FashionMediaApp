import 'package:fashion_app/components/themes/colors.dart';

import 'package:fashion_app/firebase_options.dart';
import 'package:fashion_app/services/provider/UserProvider.dart';

import 'package:fashion_app/services/auth/auth_gate.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: lightMode,
        title: 'Fashion Social Media App',
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    );
  }
}
