// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasteapp/collectors/collector_initiate.dart';
import 'package:wasteapp/collectors/collector_message_page.dart';
import 'package:wasteapp/collectors/collector_profile.dart';
import 'package:wasteapp/pages/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollectorPgae extends StatefulWidget {
  const CollectorPgae({Key? key}) : super(key: key);

  @override
  State<CollectorPgae> createState() => _CollectorPgaeState();
}

class _CollectorPgaeState extends State<CollectorPgae> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.green[500],
          child: ListView(children: [
            ListTile(
              title: const Text(
                'Tenant',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreen()));
              },
            )
          ]),
        ),
      ),
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<DocumentSnapshot>(
                      future: users.doc(userId).get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.data == null) {
                          return Text('Please register');
                        }
                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;

                          return Text(
                            "Hi! ${data['email']}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          );
                        }

                        return Text("loading");
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Welcome to the collectors portal',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Please share",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("location and a phone number",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("to initiate a collection",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(),
          SizedBox(height: 25),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, CollectorInitiate.routeName);
                        },
                        child: Text(
                          'Initiate collection',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut().then((value) {
    MaterialPageRoute(builder: ((context) => const MainScreen()));
  });
}

class CollectorBottomNavigationPage extends StatefulWidget {
  const CollectorBottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<CollectorBottomNavigationPage> createState() =>
      _CollectorBottomNavigationPageState();
}

class _CollectorBottomNavigationPageState
    extends State<CollectorBottomNavigationPage> {
  int currentIndex = 0;
  final _pages = [CollectorPgae(), CollectorMessage(), CollectorProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green[900],
          unselectedItemColor: Colors.green[400],
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green[800]),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Requests'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
