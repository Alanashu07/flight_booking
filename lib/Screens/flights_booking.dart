import 'package:flight_booking/Models/flight_model.dart';
import 'package:flight_booking/Screens/seat_selection.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FlightsList extends StatefulWidget {
  final DateTime now;
  final String? src;
  final String? dst;
  final String? source;
  final String? destination;

  const FlightsList(
      {super.key,
      required this.now,
      this.src,
      this.dst,
      required this.source,
      this.destination});

  @override
  State<FlightsList> createState() => _FlightsListState();
}

class _FlightsListState extends State<FlightsList> {
  List<FlightModel> flights = [
    FlightModel(
        name: 'Air India',
        departure: 'IN',
        arrival: 'RUH',
        endTime: DateTime.now().add(const Duration(days: 3)),
        startTime: DateTime.now().add(const Duration(days: 2)),
        price: '₹ 25000'),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 1)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 2))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 2)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 4))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now(),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 2))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 1)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 3))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now(),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 3))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 1)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 2))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 3)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 6))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now(),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 3))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 1)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 3))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 1)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 2))),
    FlightModel(
        name: 'Air India',
        departure: 'IND',
        arrival: 'RUH',
        startTime: DateTime.now().add(const Duration(days: 2)),
        price: '₹ 25000',
        endTime: DateTime.now().add(const Duration(days: 4))),
  ];

  List<FlightModel> flightsToday = [];

  @override
  Widget build(BuildContext context) {
    flightsToday = flights
        .where((flight) =>
            flight.startTime.day == widget.now.day &&
            flight.startTime.month == widget.now.month &&
            flight.startTime.year == widget.now.year)
        .toList();
    // final date = DateTime(widget.now.year, widget.now.month, widget.now.day);
    return Scaffold(
      body: widget.source!.isEmpty && widget.destination!.isEmpty
          ? Center(
              child: Text('Please Select Source and Destination to continue'),
            )
          : widget.source!.isEmpty
              ? Center(
                  child: Text('Please Select Source to continue'),
                )
              : widget.destination!.isEmpty
                  ? Center(
                      child: Text('Please Select Destination to continue'),
                    )
                  : widget.source == widget.destination
                      ? Center(
                          child: Text('You cannot travel to the same place'),
                        )
                      : ListView.builder(
                          itemCount: flightsToday.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: SeatSelectScreen(
                                          sourceCountryCode: widget.src!,
                                          sourceCountryName: widget.source!,
                                          destinationCountryCode: widget.dst!,
                                          destinationCountryName:
                                              widget.destination!,
                                          remainingTime:
                                              '${flightsToday[index].endTime.difference(flightsToday[index].startTime).inHours} hrs ',
                                        ),
                                        type: PageTransitionType.bottomToTop));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black54,
                                          spreadRadius: 1,
                                          blurRadius: 10)
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${flightsToday[index].startTime.hour.toString().padLeft(2, '0')}:${flightsToday[index].startTime.minute.toString().padLeft(2, '0')}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Transform.rotate(
                                                    angle: 1.54,
                                                    child: const CircleAvatar(
                                                        backgroundColor:
                                                            Color(0xffffe5fb),
                                                        child: Icon(
                                                          Icons.flight,
                                                          color:
                                                              Color(0xffc13573),
                                                        ))),
                                                Text(
                                                  '${flightsToday[index].endTime.hour.toString().padLeft(2, '0')}:${flightsToday[index].endTime.minute.toString().padLeft(2, '0')}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  flightsToday[index].departure,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54),
                                                ),
                                                RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "${flightsToday[index].endTime.difference(flightsToday[index].startTime).inHours} hrs ",
                                                      style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18)),
                                                  const TextSpan(
                                                      text: "• Non- Stop",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18))
                                                ])),
                                                Text(
                                                  flightsToday[index].arrival,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              flightsToday[index].name,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              flightsToday[index].price,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
    );
  }
}
