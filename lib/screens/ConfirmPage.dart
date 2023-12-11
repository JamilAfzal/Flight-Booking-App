// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:app/screens/logic/brouchers.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({
    super.key,
  });

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

void recheckk(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        "Do You Wanna Book This Flight?",
        style: TextStyle(color: Colors.blue),
      ),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context); // Close the current dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  "Flight Has Been Booked",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            );
            Timer.periodic(Duration(seconds: 1), (timer) {
              timer.cancel(); // Stop the periodic timer after 1 second
              // Close the second dialog after 1 second
            });
          },
          child: Text(
            "Book",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

class _ConfirmPageState extends State<ConfirmPage> {
  final _formkey1 = GlobalKey<FormState>();
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ms = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background-plane.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: ms.height * 0.15,
            left: ms.width * 0.13,
            right: ms.width * 0.13,
            child: Container(
              width: 250,
              height: 550,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15)),
              child: Form(
                  key: _formkey1,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Confirm Booking",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                              letterSpacing: 1.9),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: text1,
                          decoration: InputDecoration(
                            hintText: "Name",
                            suffixIcon: Icon(Icons.sign_language_outlined,
                                color: Colors.blue),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Name";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: text2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "CNIC-No Without -",
                              suffixIcon: Icon(Icons.numbers_outlined,
                                  color: Colors.blue)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter CNIC";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              hintText: "Booking Date",
                              suffixIcon: Icon(Icons.date_range_outlined,
                                  color: Colors.blue)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Choose Date";
                            }
                            return null;
                          },
                          controller: text3,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "E-Mail",
                              suffixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.blue,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Choose Date";
                            }
                            return null;
                          },
                          controller: text4,
                        ),
                        TextFormField(
                          controller: text5,
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              hintText: "Debit Card",
                              suffixIcon: Icon(
                                Icons.numbers_outlined,
                                color: Colors.blue,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Details";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formkey1.currentState!.validate()) {
                                  recheckk(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white),
                              child: Text("Confirm")),
                        )
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
