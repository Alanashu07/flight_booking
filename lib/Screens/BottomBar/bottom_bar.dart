import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flight_booking/Screens/BottomBar/profile_screen.dart';
import 'package:flight_booking/Screens/BottomBar/search_view.dart';
import 'package:flutter/material.dart';
import '../../Models/user_model.dart';
import '../../main.dart';
import 'booking_screen.dart';
import 'chat_screen.dart';
import 'home_view.dart';

final navigationKey = GlobalKey<CurvedNavigationBarState>();

class BottomBar extends StatefulWidget {

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int index = 0;
  bool isLower = false;

  final items = [
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.search,
      size: 30,
    ),
    const Icon(
      Icons.flight,
      size: 30,
    ),
    const Icon(
      Icons.chat,
      size: 30,
    ),
    const Icon(
      Icons.person_outline,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final screens = [
      HomeView(),
      const SearchScreen(),
      const BookingScreen(),
      const ChatScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: PageTransitionSwitcher(
        reverse: isLower,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: screens[index],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
            key: navigationKey,
            index: index,
            backgroundColor: Colors.transparent,
            onTap: (index) => setState(() {
                  if (index < this.index) {
                    isLower = true;
                  } else {
                    isLower = false;
                  }
                  this.index = index;
                }),
            height: 60,
            color: const Color(0xff81194c),
            buttonBackgroundColor: const Color(0xff81194c),
            items: items),
      ),
    );
  }
}
