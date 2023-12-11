// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/screens/logic/Flightlogic.dart';
import 'package:app/screens/logic/Flighttile.dart';
import 'package:flutter/material.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  List<Flight> flightlist = [
    Flight(text: "Tokyo", date: "1-1-2024", image: "assets/images/tokyo.jpg"),
    Flight(text: "Rome", date: "20-1-2024", image: "assets/images/rome.jpg"),
    Flight(text: "Egypt", date: "21-1-2024", image: "assets/images/egypt.jpg"),
    Flight(text: "Tokyo", date: "1-2-2024", image: "assets/images/tokyo.jpg"),
    Flight(text: "Egypt", date: "6-2-2024", image: "assets/images/egypt.jpg"),
    Flight(text: "Rome", date: "10-2-2024", image: "assets/images/rome.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    final mz = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          SizedBox(
            width: mz.width * 1,
          ),
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [BoxShadow(blurRadius: 10.0)],
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 130.0)),
            ),
            child: Center(
                child: Text(
              "Upcoming Flights",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: flightlist.length,
                itemBuilder: (context, index) {
                  return FlightTile(flight: flightlist[index]);
                }),
          )
        ],
      ),
    );
  }
}
