import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Widgets/custom_button.dart';
import 'package:flight_booking/Widgets/separator.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class BoardingPass extends StatefulWidget {
  final List booked;
  final String sourceCountryCode;
  final String sourceCountryName;
  final String destinationCountryCode;
  final String destinationCountryName;
  final String remainingTime;
  final String classType;

  const BoardingPass(
      {super.key,
      required this.booked,
      required this.sourceCountryCode,
      required this.sourceCountryName,
      required this.destinationCountryCode,
      required this.destinationCountryName,
      required this.remainingTime, required this.classType});

  @override
  State<BoardingPass> createState() => _BoardingPassState();
}

final user = FirebaseAuth.instance.currentUser!;

class _BoardingPassState extends State<BoardingPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f0f0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Boarding Pass"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: mq.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black12, width: .5)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.sourceCountryCode,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.sourceCountryName,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xffffe5fb),
                                child: Transform.rotate(
                                  angle: 1.6,
                                  child: const Icon(Icons.flight, color: Color(0xffc13573),),
                                ),
                              ),
                              Text(
                                widget.remainingTime,
                                style: const TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.destinationCountryCode,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.destinationCountryName,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    MySeparator(color: Colors.grey.withOpacity(0.4),height: 2, dashWidth: 5,),
                    Padding(padding: const EdgeInsets.all(16),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(user.displayName!.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
                    ),
                    Padding(padding: EdgeInsets.only(left: 16, right: mq.width*.2), child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Flight", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w500),),
                            Text("LY8564", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Terminal", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w500),),
                            Text("3", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ],
                        )
                      ],
                    ),),
                    const SizedBox(height: 25,),
                    Padding(padding: EdgeInsets.only(left: 16, right: mq.width*.2), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gate", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w500),),
                            Text("LY8564", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Class", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w500),),
                            Text(widget.classType, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ],
                        )
                      ],
                    ),),
                    const SizedBox(height: 25,),
                    Padding(padding: EdgeInsets.only(left: 16, right: mq.width*.15), child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Depart", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w500),),
                            Text("13 May 13:58", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Passport ID", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w500),),
                            Text("63875708", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ],
                        )
                      ],
                    ),),
                    const SizedBox(height: 20,),
                    MySeparator(color: Colors.grey.withOpacity(0.4),height: 2, dashWidth: 5,),
                    const SizedBox(height: 10,),
                    Image.asset('images/barcode.PNG'),
                    SizedBox(height: 15,)
                  ],
                ),
              ),
            ),
            SizedBox(height: mq.height*.05,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(onTap: (){}, child: const Text('Download Ticket', style: TextStyle(color: Colors.white, fontSize: 16),)),
            ),
            SizedBox(height: mq.height*.04)
          ],
        ),
      ),
    );
  }
}
