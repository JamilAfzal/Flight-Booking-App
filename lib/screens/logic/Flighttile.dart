import 'package:app/screens/logic/Flightlogic.dart';
import 'package:flutter/material.dart';

class FlightTile extends StatefulWidget {
  final Flight flight;
  const FlightTile({super.key, required this.flight});

  @override
  State<FlightTile> createState() => _FlightTileState();
}

class _FlightTileState extends State<FlightTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Card(
        elevation: 12,
        child: ListTile(
          leading: Image.asset(
            widget.flight.image,
            fit: BoxFit.cover,
            width: 50,
            height: 40,
          ),
          title: Text(
            widget.flight.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            widget.flight.date,
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
