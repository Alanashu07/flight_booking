import 'package:flight_booking/Services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.date_range_rounded, size: 30,),
          title: const Text('Bookings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.heart_fill, size: 30,),
          title: const Text('Favorites', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.xmark_circle_fill, size: 30,),
          title: const Text('Cancel Booking', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.settings, size: 30,),
          title: const Text('Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.share, size: 30,),
          title: const Text('Share to a friend', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.headset_mic, size: 30,),
          title: const Text('Contact Us', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.star_circle_fill, size: 30,),
          title: const Text('Rate us', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.logout, size: 30,),
          title: const Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onTap: ()=> authService.signOut(context),
        ),
      ],
    );
  }
}
