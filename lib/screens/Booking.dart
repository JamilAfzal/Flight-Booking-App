// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/screens/ConfirmPage.dart';
import 'package:app/screens/logic/brouchers.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final Logic logics;
  BookingScreen({super.key, required this.logics});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController text1 = TextEditingController();
  @override
  void initState() {
    super.initState();
    text1 =
        TextEditingController(text: "${selectedDate.toLocal()}".split(' ')[0]);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 8),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        text1.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void recheck(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Book This Flight"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ConfirmPage())),
                  child: Text("Confirm"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              widget.logics.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 170,
            left: 10,
            right: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Colors.white.withOpacity(0.7),
                width: 360,
                height: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Flight to ${widget.logics.name}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/plane1.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "KHI",
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 22, 237),
                              ),
                            ),
                            Text(
                              "___________________",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 3, 22, 237),
                              ),
                            ),
                            Text(
                              widget.logics.name,
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 22, 237),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          "assets/images/plane2.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Booking Date",
                          style: TextStyle(
                              letterSpacing: 1.9,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select date'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            recheck(context);
                          },
                          child: Container(
                            width: 80,
                            height: 30,
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
