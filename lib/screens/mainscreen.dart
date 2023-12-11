// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/screens/Booking.dart';
import 'package:app/screens/SignIn.dart';
import 'package:app/screens/database.dart';
import 'package:app/screens/logic/Broucherstile.dart';
import 'package:app/screens/logic/brouchers.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List brouchers = [
    Logic(
        name: "Tokyo",
        subtitle: "Best Time",
        image: "assets/images/tokyo.jpg",
        button: "Book A Flight"),
    Logic(
        name: "London",
        subtitle: "Best Selling",
        image: "assets/images/london.jpg",
        button: "Book A flight"),
    Logic(
        name: "Egypt",
        subtitle: "Pyramid",
        image: "assets/images/egypt.jpg",
        button: "Book A Flight"),
    Logic(
        name: "Rome",
        subtitle: "Best Vacation",
        image: "assets/images/rome.jpg",
        button: "Book A Flight")
  ];
  void navigatetobrouchers(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookingScreen(
                  logics: brouchers[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 43, 125, 197),
            radius: 15,
          ),
        ),
        actions: [
          DrawerButton(),
          SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Hi,Jamil Afzal",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Where will you go?",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  contentPadding: EdgeInsets.all(9),
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                  ),
                  hintText: "Search Location",
                  filled: true,
                  fillColor: Color.fromARGB(193, 224, 218, 218)),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      fontSize: 20),
                ),
                Text("See All", style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                        height: 70,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                            "assets/images/aeroplanes.png",
                            width: 55,
                            height: 55,
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Train")
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 70,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Image.asset(
                              "assets/images/plane.png",
                              width: 55,
                              height: 55,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Flights")
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 70,
                        width: 75,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueAccent,
                                Colors.white10,
                                Colors.blueAccent
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.center,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                            "assets/images/cameraa.png",
                            width: 55,
                            height: 55,
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Camera")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              "Best Offers",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                  fontSize: 20),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 6, left: 20, right: 20, bottom: 20),
                child: ListView.builder(
                    itemCount: brouchers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Promo(
                        logicc: brouchers[index],
                        onTap: () {
                          navigatetobrouchers(index);
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
