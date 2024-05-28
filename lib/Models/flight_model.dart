import 'package:flutter/material.dart';

class FlightModel{
  final String name;
  final String departure;
  final String arrival;
  final DateTime startTime;
  final DateTime endTime;
  final String price;
  final String? id;

  FlightModel({required this.name, required this.departure, required this.arrival, required this.startTime, required this.endTime, required this.price, this.id});
}