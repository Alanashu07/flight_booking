import 'package:country_picker/country_picker.dart';
import 'package:flight_booking/Screens/flights_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Country? sourceCountry;
  Country? destinationCountry;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              final navigationState = navigationKey.currentState!;
              navigationState.setPage(0);
            },
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        setState(() {
                          sourceCountry = country;
                        });
                      },
                    );
                  },
                  child: Text(sourceCountry?.countryCode ?? "SRC")),
              const Icon(Icons.arrow_right_alt, size: 40),
              GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        setState(() {
                          destinationCountry = country;
                        });
                      },
                    );
                  },
                  child: Text(destinationCountry?.countryCode ?? "DST")),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'images/vertical.png',
                  scale: 15,
                ),
              ),
            ),
          ],
          bottom: TabBar(
              dividerColor: Colors.transparent,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
              tabs: [
                Tab(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Align(
                          alignment: Alignment.center, child: Text("Today"))),
                ),
                Tab(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text("Tomorrow"))),
                ),
                Tab(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text("Day after"))),
                ),
              ]),
        ),
        body: TabBarView(children: [
          FlightsList(
            now: DateTime.now(),
            src: sourceCountry?.countryCode ?? '',
            dst: destinationCountry?.countryCode ?? '',
            source: sourceCountry?.name ?? '',
            destination: destinationCountry?.name ?? '',
          ),
          FlightsList(
            now: DateTime.now().add(const Duration(days: 1)),
            src: sourceCountry?.countryCode ?? '',
            dst: destinationCountry?.countryCode ?? '',
            source: sourceCountry?.name ?? '',
            destination: destinationCountry?.name ?? '',
          ),
          FlightsList(
            now: DateTime.now().add(const Duration(days: 2)),
            src: sourceCountry?.countryCode ?? '',
            dst: destinationCountry?.countryCode ?? '',
            source: sourceCountry?.name ?? '',
            destination: destinationCountry?.name ?? '',
          )
        ]),
      ),
    );
  }
}
