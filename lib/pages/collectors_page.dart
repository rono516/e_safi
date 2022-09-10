// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/exercise_title.dart';

class CollectorsPage extends StatefulWidget {
  const CollectorsPage({Key? key}) : super(key: key);

  @override
  State<CollectorsPage> createState() => _CollectorsPageState();
}

class _CollectorsPageState extends State<CollectorsPage> {
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
                    //exercise heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Collectors available',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        // Icon(Icons.home, color: Colors.green),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.people, color: Colors.green))
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
                                title: Text('Location',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: Text(
                                  'Phone Number',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Icon(Icons.message),
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
