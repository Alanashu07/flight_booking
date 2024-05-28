import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../main.dart';
import '../profile_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
              width: mq.width,
              child: Column(
                children: [
                  SizedBox(
                    height: mq.height * .05,
                  ),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.network(
                        user.photoURL ?? 'https://res.cloudinary.com/diund1rdq/image/upload/v1713292535/vlbijhr4m5eeu6vrqdfi.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .02,
                  ),
                  Text(
                    user.displayName ?? 'New User',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: mq.height * .02,
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Edit',
                          style: TextStyle(
                              color: Color(0xff81194c),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.edit,
                          color: Color(0xff81194c),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mq.height*.04,
                  ),
                  const ProfileMenu()
                ],
              ),
            )),
      ),
    );
  }
}
