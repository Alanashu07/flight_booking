import 'package:flutter/material.dart';

class UpcomingTrips extends StatelessWidget {
  final String startingDate;
  final String sourceShort;
  final String sourceFull;
  final String endDate;
  final String destinationShort;
  final String destinationFull;

  const UpcomingTrips(
      {super.key,
      required this.startingDate,
      required this.sourceShort,
      required this.sourceFull,
      required this.destinationShort,
      required this.destinationFull,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient:
              LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                startingDate,
                style: const TextStyle(color: Colors.black54),
              ),
              Text(
                sourceShort,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                sourceFull,
                style: const TextStyle(color: Colors.black54),
              )
            ],
          ),
          Image.asset(
            'images/direct-flight.png',
            scale: 10,
            color: Colors.black54,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(endDate, style: const TextStyle(color: Colors.black54),),
              Text(destinationShort, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              Text(destinationFull, style: const TextStyle(color: Colors.black54),)
            ],
          ),
        ],
      ),
    );
  }
}
