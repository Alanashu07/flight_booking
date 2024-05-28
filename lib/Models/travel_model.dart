import 'package:flight_booking/Models/user_model.dart';

class TravelModel {
  final String? id;
  final List<User> passengers;
  final String startDate;
  final String endDate;
  final String source;
  final String destination;
  final String price;
  final String airline;
  final String bookedTime;
  final String status;

  TravelModel(
      {this.id,
      required this.passengers,
      required this.startDate,
      required this.endDate,
      required this.source,
      required this.destination,
      required this.price,
      required this.airline,
      required this.bookedTime,
      required this.status});
}
