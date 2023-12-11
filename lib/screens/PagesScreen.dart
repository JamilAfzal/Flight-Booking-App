// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/screens/Flightscreen.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  PageController pagee = PageController();
  int selectedindex = 0;
  final List<Widget> _pages = [MainScreen(), FlightScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pagee,
          onPageChanged: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          children: _pages,
        ),
        bottomNavigationBar: GNav(
          color: Colors.grey[500],
          tabBorderRadius: 25,
          activeColor: Color.fromARGB(255, 249, 249, 250),
          gap: 30,
          backgroundColor: const Color.fromARGB(255, 241, 239, 241),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          tabBackgroundColor: Color.fromARGB(255, 43, 125, 197),
          iconSize: 24,
          onTabChange: (index) {
            setState(() {
              selectedindex = index;
              pagee.animateToPage(selectedindex,
                  duration: Duration(microseconds: 1), curve: Curves.linear);
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            )
          ],
        ));
  }
}
