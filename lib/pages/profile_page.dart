// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasteapp/pages/main_screen.dart';
import 'package:wasteapp/widgets/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_constructors
            children: [
              Text(
                'User Profile',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text('Name',
                  style: TextStyle(color: Colors.grey[300], fontSize: 20)),
              Text('Email',
                  style: TextStyle(color: Colors.grey[300], fontSize: 20)),
              TextButton(
                  onPressed: signOut,
                  child: Text('Logout',
                      style: TextStyle(color: Colors.grey[300], fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut().then((value) {
    MaterialPageRoute(builder: ((context) => const MainScreen()));
  });
}
