// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:app/screens/PagesScreen.dart';
import 'package:app/screens/SignIn.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    });
  }

  @override
  void dispose() {
    // Cancel the timer in the dispose method to avoid memory leaks
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/background-plane.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
            bottom: 50,
            left: 20,
            child: Text(
              "Travel Around The World \n In Affordable Price",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ))
      ],
    ));
  }
}
