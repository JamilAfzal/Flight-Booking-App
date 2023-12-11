// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Database extends StatefulWidget {
  const Database({super.key});

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  final database = FirebaseDatabase.instance.ref("Posts");
  final databasecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("Posts"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: databasecontroller,
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write Something To Add In DataBase...")),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
