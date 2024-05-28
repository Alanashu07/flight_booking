import 'package:country_picker/country_picker.dart';
import 'package:flight_booking/Screens/country_selection.dart';
import 'package:flight_booking/Widgets/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class TravelSelector extends StatefulWidget {
  const TravelSelector({super.key});

  @override
  State<TravelSelector> createState() => _TravelSelectorState();
}

class _TravelSelectorState extends State<TravelSelector> {

  late String source = '';
  late String destination = '';

  bool isSwitched = false;



  void switchPlaces(){
  setState(() {
    String temp = source;
    source = destination;
    destination = temp;
  });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 25, offset: Offset(0, 2), blurStyle: BlurStyle.outer)],
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) {
                          setState(() {
                            source = country.name;
                          });
                        },
                      );
                    },
                    child: TravelInputField(
                      label: 'From',
                      value: source.isNotEmpty ? source : 'Source',
                      icon: Icons.flight_takeoff,
                    ),
                  ),
                  const MySeparator(color: Colors.grey, dashWidth: 2, height: 2, count: 4,),
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) {
                          setState(() {
                            destination = country.name;
                          });
                        },
                      );
                    },
                    child: TravelInputField(
                      label: 'To',
                      value: destination.isNotEmpty ? destination : 'Destination',
                      icon: Icons.flight_land,
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 10,
                  top: mq.height * .05,
                  child: GestureDetector(
                    onTap: switchPlaces,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Image.asset('images/switch.png', height: 18, color: const Color(0xff81194c),),),
                  ))
            ],
          ),
        ),
    );
  }
}

class TravelInputField extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const TravelInputField({super.key, required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.grey),),
                const SizedBox(width: 16.0),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}