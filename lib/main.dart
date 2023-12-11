// ignore_for_file: prefer_const_constructors

import 'package:app/firebase_options.dart';
import 'package:app/screens/ConfirmPage.dart';
import 'package:app/screens/PagesScreen.dart';
import 'package:app/screens/SignIn.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:app/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";

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
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splashscreen());
  }
}
