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
    return
        // Scaffold(
        //   // appBar: AppBar(
        //   //   title: const Text('This is the collector page'),
        //   // ),
        //   //backgroundColor: Colors.green[800],
        //   body: const Center(
        //     child: Center(
        //       child: Text('Collector'),
        //     ),
        //     //   //TextButton(onPressed: signOut, child: Text('Logout')),
        //     // ),
        //   ),
        Scaffold(
      //   drawer: MainDrawer(),
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(children: [
          //Greetings
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
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
                          // if (data['fullName'] == null) {
                          //   return Text(
                          //     'Welcome to Esafi',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 24,
                          //         fontWeight: FontWeight.bold),
                          //   );
                          // }
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

                    // ListView(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       ListTile(
                    //         title: Text(
                    //             'You can initiate a collection by providing '),
                    //         isThreeLine: true,
                    //         subtitle: Text(
                    //             'location and a phone number to allow tenants'),
                    //       ),
                    //     ]),
                    SizedBox(height: 8),

                    Text("You can initiate a collection by providing",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("location and a phone number to allow tenants",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("to reach you throughout your collection cycle",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    // Text(
                    //   'Hi, Collins!',
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 8), //space between texts
                    // Text(DateFormat.yMMMMd('en_US').format(DateTime.now()),
                    //     style: TextStyle(
                    //       color: Colors.green[100],
                    //       fontSize: 17,
                    //     )),
                  ],
                ),
                //notification bell
                // Container(
                //     padding: EdgeInsets.all(6),
                //     decoration: BoxDecoration(
                //         color: Colors.green[200],
                //         borderRadius: BorderRadius.circular(12)),
                //     child: Icon(Icons.notifications, color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(),

          //how do you feel
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //   child:
          //       // Row(
          //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       //   children: [
          //       FutureBuilder<DocumentSnapshot>(
          //     future: users.doc(userId).get(),
          //     builder: (BuildContext context,
          //         AsyncSnapshot<DocumentSnapshot> snapshot) {
          //       if (snapshot.data == null) {
          //         return Text('Please register');
          //       }
          //       if (snapshot.hasError) {
          //         return Text("Something went wrong");
          //       }

          //       if (snapshot.connectionState == ConnectionState.done) {
          //         Map<String, dynamic> data =
          //             snapshot.data!.data() as Map<String, dynamic>;
          //         if (data['date'] == null) {
          //           return Text(
          //             'Please register for waste collection ',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.bold),
          //           );
          //         }
          //         return Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 'Your next collection is',
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 20),
          //               ),
          //               Text(
          //                 DateFormat.yMMMMd('en_US')
          //                     .format(data['date'].toDate()),
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 18),
          //               )
          //             ]);
          //       }

          //       return Text("loading");
          //     },
          //   ),
          // ),

          SizedBox(height: 25),

          //white area
          Expanded(
            child: Container(
              padding: EdgeInsets.all(28),
              // color: Colors.grey[300],
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
                    //exercise heading
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Current waste profile',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 20),
                    //     ),
                    //     Icon(Icons.people),
                    //   ],
                    // ),
                    SizedBox(height: 20),
                    //fgg

                    //ListView of exercises
                    // Expanded(
                    //   child: ListView(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(bottom: 8.0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(16),
                    //           ),
                    //           child: ListTile(
                    //             leading: ClipRRect(
                    //               borderRadius: BorderRadius.circular(12),
                    //               child: Container(
                    //                   padding: EdgeInsets.all(6),
                    //                   color: Colors.orange,
                    //                   child: Icon(Icons.numbers_outlined,
                    //                       size: 25, color: Colors.white)),
                    //             ),
                    //             title: Text('Bins available',
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16)),
                    //             subtitle: Text('From IOT'),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(height: 5),
                    //       Padding(
                    //         padding: const EdgeInsets.only(bottom: 8.0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(16),
                    //           ),
                    //           child: ListTile(
                    //             leading: ClipRRect(
                    //               borderRadius: BorderRadius.circular(12),
                    //               child: Container(
                    //                   padding: EdgeInsets.all(6),
                    //                   color: Colors.orange,
                    //                   child: Icon(Icons.height,
                    //                       size: 25, color: Colors.white)),
                    //             ),
                    //             title: Text('Current bin level',
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16)),
                    //             subtitle: Text('From IOT'),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(height: 5),
                    //       Padding(
                    //         padding: const EdgeInsets.only(bottom: 8.0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(16),
                    //           ),
                    //           child: ListTile(
                    //             leading: ClipRRect(
                    //               borderRadius: BorderRadius.circular(12),
                    //               child: Container(
                    //                   padding: EdgeInsets.all(6),
                    //                   color: Colors.orange,
                    //                   child: Icon(Icons.location_city,
                    //                       size: 25, color: Colors.white)),
                    //             ),
                    //             title: Text('Bin location',
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16)),
                    //             subtitle: FutureBuilder<DocumentSnapshot>(
                    //               future: users.doc(userId).get(),
                    //               builder: (BuildContext context,
                    //                   AsyncSnapshot<DocumentSnapshot>
                    //                       snapshot) {
                    //                 if (snapshot.data == null) {
                    //                   return Text('Please register');
                    //                 }
                    //                 if (snapshot.hasError) {
                    //                   return Text("Something went wrong");
                    //                 }
                    //                 if (snapshot.connectionState ==
                    //                     ConnectionState.done) {
                    //                   Map<String, dynamic> data = snapshot.data!
                    //                       .data() as Map<String, dynamic>;
                    //                   return Text(
                    //                     data['location'].toString(),
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.bold),
                    //                   );
                    //                 }

                    //                 return Text("loading");
                    //               },
                    //             ),
                    //             // trailing: Icon(Icons.more_horiz),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(height: 5),
                    //       Padding(
                    //         padding: const EdgeInsets.only(bottom: 8.0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(16),
                    //           ),
                    //           child: ListTile(
                    //             leading: ClipRRect(
                    //               borderRadius: BorderRadius.circular(12),
                    //               child: Container(
                    //                   padding: EdgeInsets.all(6),
                    //                   color: Colors.orange,
                    //                   child: Icon(Icons.location_city,
                    //                       size: 25, color: Colors.white)),
                    //             ),
                    //             title: Text('Apartment',
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16)),
                    //             subtitle: FutureBuilder<DocumentSnapshot>(
                    //               future: users.doc(userId).get(),
                    //               builder: (BuildContext context,
                    //                   AsyncSnapshot<DocumentSnapshot>
                    //                       snapshot) {
                    //                 if (snapshot.data == null) {
                    //                   return Text('Please register');
                    //                 }
                    //                 if (snapshot.hasError) {
                    //                   return Text("Something went wrong");
                    //                 }
                    //                 if (snapshot.connectionState ==
                    //                     ConnectionState.done) {
                    //                   Map<String, dynamic> data = snapshot.data!
                    //                       .data() as Map<String, dynamic>;
                    //                   return Text(
                    //                     data['apartment'].toString(),
                    //                     style: TextStyle(
                    //                         color: Colors.grey,
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.bold),
                    //                   );
                    //                 }

                    //                 return Text("loading");
                    //               },
                    //             ),
                    //             // trailing: Icon(Icons.more_horiz),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(height: 5),
                    //     ],
                    //   ),
                    // ),

                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed(Collection);
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
      floatingActionButton: FloatingActionButton(
          onPressed: signOut,
          backgroundColor: Colors.green[800],
          child: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          )),
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
