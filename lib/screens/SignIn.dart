// ignore_for_file: prefer_const_constructors

import 'package:app/screens/SignUp.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:app/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwordcontroller.text.toString())
        .then((value) {
      debugPrint("${value.user}");
      if (value.user != null) {
        Utils().toast(value.user!.email.toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        Utils().toast("User is null");
      }
    }).onError((error, stackTrace) {
      debugPrint("Error");
      Utils().toast(error.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mz = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        Image.asset(
          "assets/images/background-plane.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: mz.height * 0.25,
          left: mz.width * 0.10,
          right: mz.width * 0.07,
          bottom: mz.height * 0.14,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  prefixIcon: Icon(Icons.email_outlined)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordcontroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.password_outlined)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                                return null;
                              },
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          login();
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 43, 125, 197),
                        ),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have An Account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text("Sign Up"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
