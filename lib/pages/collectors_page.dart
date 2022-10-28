// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/pages/collection_page.dart';
import 'package:wasteapp/pages/requests_page.dart';

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
                            icon: Icon(Icons.people, color: Colors.green[700]))
                      ],
                    ),
                    SizedBox(height: 20),

                    //ListView of exercises
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("users")
                                      .where("wrool", isEqualTo: "Collector")
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != null) {
                                      final collectors = snapshot.data!.docs;
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: collectors.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              margin: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    leading: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(6),
                                                          color: Colors.orange,
                                                          child: Icon(
                                                              Icons.person,
                                                              size: 25,
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                    isThreeLine: true,
                                                    title: Text(
                                                        //should be location
                                                        collectors[index]
                                                                ['location'] ??
                                                            '''
                                                            Email: ${collectors[index]['email']}
                                                             Location: Not collecting
                                                               ''',
                                                        // 'Location',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16)),
                                                    subtitle: Text(
                                                      //should be phone number
                                                      collectors[index]
                                                              ['number'] ??
                                                          'Number: Not reachable',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    trailing:
                                                        // Icon(Icons.message)
                                                        IconButton(
                                                            color: Colors.green,
                                                            onPressed: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  CollectionPage
                                                                      .routeName);
                                                            },
                                                            icon: Icon(
                                                                Icons.message)),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Divider(height: 10)
                                                ],
                                              ),

                                              // SizedBox(height: 15),
                                            );
                                          });
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  })),
                          SizedBox(height: 15),
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
