// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/main_screen.dart';

class CollectorProfile extends StatefulWidget {
  const CollectorProfile({Key? key}) : super(key: key);

  @override
  State<CollectorProfile> createState() => _CollectorProfileState();
}

class _CollectorProfileState extends State<CollectorProfile> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 25),

          //white area
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              color: Colors.grey[300],
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'User Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              color: Colors.green,
                              size: 40,
                            ))
                      ],
                    ),
                    SizedBox(height: 20),

                    //user data
                    Expanded(
                      child: ListView(
                        children: [
                          // Padding(
                          //   //Name
                          //   padding: const EdgeInsets.only(bottom: 8.0),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(16),
                          //     ),
                          //     child: ListTile(
                          //       leading: ClipRRect(
                          //         borderRadius: BorderRadius.circular(12),
                          //         child: Container(
                          //             padding: EdgeInsets.all(6),
                          //             color: Colors.orange,
                          //             child: Icon(Icons.person,
                          //                 size: 25, color: Colors.white)),
                          //       ),
                          //       title: Text('Name',
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 16)),
                          //       subtitle: FutureBuilder<DocumentSnapshot>(
                          //         future: users.doc(userId).get(),
                          //         builder: (BuildContext context,
                          //             AsyncSnapshot<DocumentSnapshot>
                          //                 snapshot) {
                          //           if (snapshot.data == null) {
                          //             return Text('Please register');
                          //           }
                          //           if (snapshot.hasError) {
                          //             return Text("Something went wrong");
                          //           }
                          //           if (snapshot.connectionState ==
                          //               ConnectionState.done) {
                          //             Map<String, dynamic> data = snapshot.data!
                          //                 .data() as Map<String, dynamic>;
                          //             if (data['fullName'] == null) {
                          //               return Text('Please register');
                          //             }
                          //             return Text(
                          //               data['fullName'],
                          //               style: TextStyle(
                          //                   color: Colors.grey,
                          //                   fontSize: 16,
                          //                   fontWeight: FontWeight.bold),
                          //             );
                          //           }

                          //           return Text("loading");
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          Padding(
                            //Email
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                      padding: EdgeInsets.all(6),
                                      color: Colors.orange,
                                      child: Icon(Icons.email,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Email',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: FutureBuilder<DocumentSnapshot>(
                                  future: users.doc(userId).get(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot) {
                                    if (snapshot.data == null) {
                                      return Text('Please register');
                                    }
                                    if (snapshot.hasError) {
                                      return Text("Something went wrong");
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      if (data['email'] == null) {
                                        return Text('Please register');
                                      }
                                      return Text(
                                        data['email'],
                                        // 'Email',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }

                                    return Text("loading");
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                onTap: signOut,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                      padding: EdgeInsets.all(6),
                                      color: Colors.orange,
                                      child: Icon(Icons.exit_to_app,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Signout',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: Text(
                                  'Signout',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                // trailing: Icon(Icons.more_horiz),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
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
