// ignore_for_file: prefer_const_constructors

import 'package:app/screens/SignIn.dart';
import 'package:app/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  bool load = false;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
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
          left: mz.width * 0.09,
          right: mz.width * 0.06,
          bottom: mz.height * 0.11,
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.8)),
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
                              keyboardType: TextInputType.emailAddress,
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
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: emailcontroller.text.toString(),
                                  password: passwordcontroller.text.toString())
                              .then((value) {
                            setState(() {
                              loading = false;
                            });
                          }).onError((error, stackTrace) {
                            Utils().toast("Account Already Exists");
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 43, 125, 197),
                        ),
                        child: Center(
                          child: load
                              ? CircularProgressIndicator()
                              : Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have An Account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: Text("Sign In"))
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
