// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/collectors/collector_page.dart';
import 'package:wasteapp/pages/home_page.dart';
import 'package:wasteapp/pages/login.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/main_screen';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(snapshot.data!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final user = snapshot.data!;
                    if (user['wrool'] == 'Collector') {
                      return CollectorPgae();
                    } else if (user['wrool'] == 'Tenant') {
                      //return HomePage();
                      return BottomNavigationPage();
                    }
                  }
                  return Material(
                    child: Center(child: CircularProgressIndicator()),
                  );
                });
          }
          return LoginPage();
        }));
  }
}
