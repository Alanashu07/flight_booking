import 'package:flight_booking/Widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../main.dart';
import 'boarding_pass.dart';

class SeatSelectScreen extends StatefulWidget {
  final String sourceCountryCode;
  final String sourceCountryName;
  final String destinationCountryCode;
  final String destinationCountryName;
  final String remainingTime;

  const SeatSelectScreen(
      {super.key,
      required this.sourceCountryCode,
      required this.sourceCountryName,
      required this.destinationCountryCode,
      required this.destinationCountryName,
      required this.remainingTime});

  @override
  State<SeatSelectScreen> createState() => _SeatSelectScreenState();
}

class _SeatSelectScreenState extends State<SeatSelectScreen> {
  var countSeatLeft = 2 * 5;
  var countSeatRight = 2 * 50;
  var listSeatLeft = [];
  var listSeatRight = [];
  var rCountSeatLeft = 2 * 5;
  var rCountSeatRight = 2 * 50;
  var rListSeatLeft = [];
  var rListSeatRight = [];
  List<String> seatNumbers = [];
  var booked = [];

  @override
  void initState() {
    initSeatValue(listSeatLeft, countSeatLeft, "A");
    initSeatValue(listSeatRight, countSeatRight, "C");
    initSeatValue(rListSeatLeft, rCountSeatLeft, "B");
    initSeatValue(rListSeatRight, rCountSeatRight, "D");
    super.initState();
  }

  String getClassType() {
    String seat = seatNumbers.join(',');
    if ((seat.contains('A') || seat.contains('B')) &&
        (seat.contains('C') || seat.contains('D'))) {
      return 'Business, Economy';
    } else if ((seat.contains('A') || seat.contains('B'))) {
      return 'Business';
    } else if ((seat.contains('C') || seat.contains('D'))) {
      return 'Economy';
    } else {
      return 'Economy';
    }
  }

  void initSeatValue(List data, count, side) {
    var objectData;
    for (int i = 0; i < count; i++) {
      objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
      };
      setState(() {
        data.add(objectData);
      });
    }
  }

  addToBooked() {
    for (var seat in listSeatLeft) {
      if (seat["isSelected"] && booked.contains(seat) == false) {
        setState(() {
          booked.add(seat);
          seatNumbers.add(seat['id']);
        });
      }
    }
    for (var seat in listSeatRight) {
      if (seat["isSelected"] && booked.contains(seat) == false) {
        setState(() {
          booked.add(seat);
          seatNumbers.add(seat['id']);
        });
      }
    }
    for (var seat in rListSeatLeft) {
      if (seat["isSelected"] && booked.contains(seat) == false) {
        setState(() {
          booked.add(seat);
          seatNumbers.add(seat['id']);
        });
      }
    }
    for (var seat in rListSeatRight) {
      if (seat["isSelected"] && booked.contains(seat) == false) {
        setState(() {
          booked.add(seat);
          seatNumbers.add(seat['id']);
        });
      }
    }
  }

  removeFromBooked() {
    for (var seat in listSeatLeft) {
      if (!seat["isSelected"] && booked.contains(seat) == true) {
        setState(() {
          booked.remove(seat);
          seatNumbers.remove(seat['id']);
        });
      }
    }
    for (var seat in listSeatRight) {
      if (!seat["isSelected"] && booked.contains(seat) == true) {
        setState(() {
          booked.remove(seat);
          seatNumbers.remove(seat['id']);
        });
      }
    }
    for (var seat in rListSeatLeft) {
      if (!seat["isSelected"] && booked.contains(seat) == true) {
        setState(() {
          booked.remove(seat);
          seatNumbers.remove(seat['id']);
        });
      }
    }
    for (var seat in rListSeatRight) {
      if (!seat["isSelected"] && booked.contains(seat) == true) {
        setState(() {
          booked.remove(seat);
          seatNumbers.remove(seat['id']);
        });
      }
    }
  }

  setBooked() {
    for (var seat in listSeatLeft) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (var seat in listSeatRight) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (var seat in rListSeatLeft) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (var seat in rListSeatRight) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f0f0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Seat Selection',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: Color(0xff9c3d3b),
              ))
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.sourceCountryCode,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.destinationCountryCode,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            width: 20,
                            height: 20,
                          ),
                          const Text("  Reserved")
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffd1a9a9)),
                            width: 20,
                            height: 20,
                          ),
                          const Text("  Available")
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.yellow),
                            width: 20,
                            height: 20,
                          ),
                          const Text("  Selected")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28),
                    child: Container(
                      width: mq.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(mq.width),
                              topRight: Radius.circular(mq.width))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "BHARAT",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900]),
                          ),
                          Text(
                            "AIRWAYS",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.red[900]),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Business Class",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              seatLeft(),
                              seatRight(),
                            ],
                          ),
                          Text(
                            "Economic Class",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ecoseatLeft(),
                              ecoseatRight(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: booked.isEmpty ? 0 : 200,
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 10)
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Class',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                            Text(
                              getClassType(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Passengers',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                            Text(
                              booked.length == 1
                                  ? '1 Adult'
                                  : '${booked.length} Adults',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Seats',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Selected Seats'),
                                        content: Text(
                                          seatNumbers.join(', '),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('Back'))
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                  width: mq.width * .2,
                                  child: Text(
                                    seatNumbers.join(', '),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Price',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                            Text(
                              '₹ ${booked.length * 25000}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: mq.width * .2,
                        ),
                        Expanded(
                            child: CustomButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: BoardingPass(
                                              booked: booked,
                                              sourceCountryCode:
                                                  widget.sourceCountryCode,
                                              sourceCountryName:
                                                  widget.sourceCountryName,
                                              destinationCountryCode:
                                                  widget.destinationCountryCode,
                                              destinationCountryName:
                                                  widget.destinationCountryName,
                                              remainingTime:
                                                  widget.remainingTime,
                                              classType: getClassType()),
                                          type:
                                              PageTransitionType.rightToLeft));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Place Order',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                    )
                                  ],
                                )))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            duration: Duration(milliseconds: 300),
            left: 0,
            right: 0,
            bottom: booked.isEmpty ? -300 : 0,
          ),
        ],
      ),
    );
  }

  Widget seatLeft() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: mq.width * .4,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listSeatLeft.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    listSeatLeft[index]["isSelected"] =
                        !listSeatLeft[index]["isSelected"];
                    if (listSeatLeft[index]["isSelected"] &&
                        !listSeatLeft[index]["isBooked"]) {
                      addToBooked();
                    }
                    if (!listSeatLeft[index]["isSelected"] &&
                        !listSeatLeft[index]["isBooked"]) {
                      removeFromBooked();
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: listSeatLeft[index]["isBooked"]
                        ? Colors.white
                        : listSeatLeft[index]["isSelected"]
                            ? Colors.yellow
                            : const Color(0xffd1a9a9),
                  ),
                  child: Text(listSeatLeft[index]["id"]),
                ),
              ),
            );
          }),
    );
  }

  Widget seatRight() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: mq.width * .4,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: rListSeatLeft.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    rListSeatLeft[index]["isSelected"] =
                        !rListSeatLeft[index]["isSelected"];
                    if (rListSeatLeft[index]["isSelected"] &&
                        !rListSeatLeft[index]["isBooked"]) {
                      addToBooked();
                    }
                    if (!rListSeatLeft[index]["isSelected"] &&
                        !rListSeatLeft[index]["isBooked"]) {
                      removeFromBooked();
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: rListSeatLeft[index]["isBooked"]
                        ? Colors.white
                        : rListSeatLeft[index]["isSelected"]
                            ? Colors.yellow
                            : const Color(0xffd1a9a9),
                  ),
                  child: Text(rListSeatLeft[index]["id"]),
                ),
              ),
            );
          }),
    );
  }

  Widget ecoseatLeft() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: mq.width * .4,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listSeatRight.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    listSeatRight[index]["isSelected"] =
                        !listSeatRight[index]["isSelected"];
                    if (listSeatRight[index]["isSelected"] &&
                        !listSeatRight[index]["isBooked"]) {
                      addToBooked();
                    }
                    if (!listSeatRight[index]["isSelected"] &&
                        !listSeatRight[index]["isBooked"]) {
                      removeFromBooked();
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: listSeatRight[index]["isBooked"]
                        ? Colors.white
                        : listSeatRight[index]["isSelected"]
                            ? Colors.yellow
                            : const Color(0xffd1a9a9),
                  ),
                  child: Text(listSeatRight[index]["id"]),
                ),
              ),
            );
          }),
    );
  }

  Widget ecoseatRight() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: mq.width * .4,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: rListSeatRight.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    rListSeatRight[index]["isSelected"] =
                        !rListSeatRight[index]["isSelected"];
                    if (rListSeatRight[index]["isSelected"] &&
                        !rListSeatRight[index]["isBooked"]) {
                      addToBooked();
                    }
                    if (!rListSeatRight[index]["isSelected"] &&
                        !rListSeatRight[index]["isBooked"]) {
                      removeFromBooked();
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: rListSeatRight[index]["isBooked"]
                        ? Colors.white
                        : rListSeatRight[index]["isSelected"]
                            ? Colors.yellow
                            : const Color(0xffd1a9a9),
                  ),
                  child: Text(rListSeatRight[index]["id"]),
                ),
              ),
            );
          }),
    );
  }
}
