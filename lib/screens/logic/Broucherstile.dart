import 'package:app/screens/Booking.dart';
import 'package:app/screens/Flightscreen.dart';
import 'package:app/screens/logic/brouchers.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Promo extends StatefulWidget {
  final Logic logicc;
  void Function()? onTap;
  Promo({super.key, required this.logicc, required this.onTap});

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        width: 230,
        height: 170,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage(
                  widget.logicc.image,
                ),
                width: 210,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: Text(
                  widget.logicc.name,
                  style: TextStyle(color: Colors.white, fontSize: 19),
                )),
            Positioned(
                top: 35,
                left: 10,
                child: Text(
                  widget.logicc.subtitle,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
            Positioned(
                top: 120,
                left: 15,
                child: ElevatedButton(
                  child: Text(
                    widget.logicc.button,
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlightScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(140, 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ))
          ],
        ),
      ),
    );
  }
}
