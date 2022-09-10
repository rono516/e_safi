// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasteapp/pages/main_screen.dart';

import '../widgets/exercise_title.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   drawer: const MainDrawer(),
        //   backgroundColor: Colors.green,
        //   body: SafeArea(
        //     child: Padding(
        //       padding: const EdgeInsets.all(15.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         // ignore: prefer_const_constructors
        //         children: [
        //           Text(
        //             'User Profiles',
        //             style: TextStyle(
        //               color: Colors.grey[300],
        //               fontWeight: FontWeight.bold,
        //               fontSize: 20,
        //             ),
        //           ),
        //           Text('Name',
        //               style: TextStyle(color: Colors.grey[300], fontSize: 20)),
        //           Text('Email',
        //               style: TextStyle(color: Colors.grey[300], fontSize: 20)),
        //           TextButton(
        //               onPressed: signOut,
        //               child: Text('Logout',
        //                   style: TextStyle(color: Colors.grey[300], fontSize: 20)))
        //         ],
        //       ),
        //     ),
        //   ),
        // );
        Scaffold(
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
                    //exercise heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'User Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        // Icon(Icons.home, color: Colors.green),
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

                    //ListView of exercises
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
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
                                      child: Icon(Icons.person,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: Text(
                                  'Exercises',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                // trailing: Icon(Icons.more_horiz),
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
                                subtitle: Text(
                                  'Email',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                // trailing: Icon(Icons.more_horiz),
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

                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       color: Colors.green),
                    //   width: double.infinity,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       startTransaction(amount: 10.0, phone: "254792009556");
                    //     },
                    //     child: Text(
                    //       'Pay Now',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    // TextButton(
                    //     onPressed: () {
                    //       startCheckout(userPhone: "254792009556", amount: 10);
                    //     },
                    //     child: Text(
                    //       'Pay Now',
                    //       style: TextStyle(color: Colors.green),
                    //     ))
                    // FloatingActionButton(
                    //     onPressed: () {
                    //       startTransaction(amount: 10.0, phone: "254792009556");
                    //     },
                    //     child: Text('Pay Now')),
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
