import 'package:firebase_core/firebase_core.dart';
import 'package:flight_booking/Screens/BottomBar/bottom_bar.dart';
import 'package:flight_booking/Screens/login_screen.dart';
import 'package:flight_booking/firebase_options.dart';
import 'package:flutter/material.dart';

import 'Models/user_model.dart';

late Size mq;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Booking',
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.white,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: const Color(0xff81194c)
            )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

_initFirebase() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
}