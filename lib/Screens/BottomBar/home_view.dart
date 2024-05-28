import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flight_booking/Models/user_model.dart';
import 'package:flight_booking/Screens/notification.dart';
import 'package:flight_booking/Widgets/travel_selector.dart';
import 'package:flight_booking/Widgets/upcoming_trips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'bottom_bar.dart';

class HomeView extends StatefulWidget {

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            pinned: false,
            floating: false,
            elevation: 0,
            leadingWidth: 100,
            leading: InkWell(
              onTap: () {
                final navigationState = navigationKey.currentState!;
                navigationState.setPage(4);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(user.photoURL ?? 'https://res.cloudinary.com/diund1rdq/image/upload/v1713292535/vlbijhr4m5eeu6vrqdfi.png'),
                ),
              ),
            ),
            expandedHeight: 260,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello!",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  user.displayName ?? 'New User',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, PageTransition(child: NotificationView(), type: PageTransitionType.bottomToTop));
                  },
                  icon: const Icon(
                    CupertinoIcons.bell,
                    color: Colors.white,
                  ))
            ],
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'images/flight.png',
                  fit: BoxFit.cover,
                )),
                Positioned(
                    bottom: 0,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          "Where are you flying to?",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        )))
              ],
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.all(20),
                child: const TravelSelector());
          }, childCount: 1)),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Suggested for you",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      final navigationState = navigationKey.currentState!;
                      navigationState.setPage(2);
                    },
                    child: Row(
                      children: [
                        const Text(
                          "View all",
                          style: TextStyle(color: Color(0xff81194c)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'images/right-arrow.png',
                          scale: 25,
                          color: const Color(0xff81194c),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }, childCount: 1)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 25,
                              offset: Offset(0, 2),
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 130,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(
                                'images/flight.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                                width: 180,
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                "₹ 25000",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upcoming Trips",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      final navigationState = navigationKey.currentState!;
                      navigationState.setPage(4);
                    },
                    child: Row(
                      children: [
                        const Text(
                          "View all",
                          style: TextStyle(color: Color(0xff81194c)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'images/right-arrow.png',
                          scale: 25,
                          color: const Color(0xff81194c),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }, childCount: 1)),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return const Padding(
                padding: EdgeInsets.all(18.0),
                child: UpcomingTrips(
                  startingDate: '24 Oct, 09:42PM',
                  sourceShort: 'LAS',
                  sourceFull: 'Las Vegas',
                  destinationShort: 'LAS',
                  destinationFull: 'Las Vegas',
                  endDate: '24 Oct, 09:42PM',
                ));
          }, childCount: 4)),
        ],
      ),
    );
  }
}
