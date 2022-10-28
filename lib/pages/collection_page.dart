// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/models/channel.dart';
import 'package:wasteapp/mpesabackend/stk_push.dart';
import 'package:wasteapp/pages/requests_page.dart';
import 'package:http/http.dart' as http;

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  static const routeName = '/collection_page';

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String stkUrl = "http://10.0.2.2:8000/tests/stk-push/success";
  final _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = FirebaseAuth.instance.currentUser!.uid;
  StkPush stkPushService = StkPush();

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Initiate Collections',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        // Icon(Icons.home, color: Colors.green),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.home, color: Colors.green))
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
                                      child: Icon(Icons.numbers_outlined,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Bins available',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: Text('1'),
                              ),
                            ),
                          ),
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
                                      child: Icon(Icons.height,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Bin level',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: FutureBuilder(
                                    future: getSensorData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.data == null) {
                                        return Text('Not connected to a bin');
                                      }
                                      return Text(
                                        int.parse(snapshot.data) > 200
                                            ? 'Bin level is ${snapshot.data}'
                                            : 'Bin level is ${snapshot.data} . Make payment to initiate collection',
                                        style: TextStyle(color: Colors.red),
                                      );
                                    }),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
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
                                      child: Icon(Icons.location_city,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Bin location',
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
                                      return Text(
                                        data['location'].toString(),
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
                              // trailing: Icon(Icons.more_horiz),
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(15.0)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: () {
                          // stkPushService.getStkPush();
                          try {
                            http
                                .get(Uri.parse(stkUrl))
                                .then((value) => {registerRequest()});
                          } catch (error) {
                            print('Error: $error');
                          }
                        },
                        child: Text(
                          'Make Payment',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void registerRequest() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    await firebaseFirestore.collection("requests").doc(user!.uid).set({
      'Date': DateTime.parse(DateTime.now().toString()),
      'Bin level': "188",
      'Location': 'Ngara'
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RequestsPage()));
  }

  getSensorData() async {
    var url =
        "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Channel channelData = channelFromMap(response.body);

      List<Feed> feedData = channelData.feeds;

      return feedData[1].field1;
    } else {
      throw Exception("failed to fetch data from thingspeak");
    }
  }
}
