// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/models/channel.dart';
import 'package:wasteapp/pages/bin_data_view.dart';
import 'package:wasteapp/pages/collectors_page.dart';
import 'package:wasteapp/pages/main_screen.dart';
import 'package:wasteapp/pages/profile_page.dart';
import 'package:wasteapp/sensordata/sensordata.dart';
import 'package:wasteapp/widgets/drawer.dart';
import 'collection_page.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();

  final _auth = FirebaseAuth.instance;
}

class _HomePageState extends State<HomePage> {
  late String userEmail;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(children: [
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
                          if (data['fullName'] == null) {
                            return Text(
                              'Welcome to Esafi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                          return Text(
                            "Hi! ${data['fullName']}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          );
                        }

                        return Text("loading");
                      },
                    ),

                    SizedBox(height: 8), //space between texts
                    Text(DateFormat.yMMMMd('en_US').format(DateTime.now()),
                        style: TextStyle(
                          color: Colors.green[100],
                          fontSize: 17,
                        )),
                  ],
                ),
                //notification bell
                Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                        onPressed: () {
                          // print(getFirstSensorData());
                          // getFirstSensorData();
                          // print('Data : ${getFirstSensorData();}');
                          // print('Data : ${getFirstSensorData()}');
                          // print(firstV);
                        },
                        icon: Icon(Icons.notifications))),
              ],
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FutureBuilder<DocumentSnapshot>(
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
                  if (data['date'] == null) {
                    return Text(
                      'Please register for waste collection ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    );
                  }
                  return Column(children: [
                    Text(
                      'Your next collection date is',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      DateFormat.yMMMMd('en_US').format(data['date'].toDate()),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ]);
                }

                return Text("loading");
              },
            ),
          ),

          SizedBox(height: 25),

          //white area
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current waste profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BinDataView(),
                                  ));
                            },
                            icon: Icon(Icons.remove_red_eye))
                      ],
                    ),
                    SizedBox(height: 20),
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
                                      child: Icon(Icons.height,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Current bin level',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: FutureBuilder(
                                    future: getSensorData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.data == null) {
                                        return Text('Loading ....');
                                      }
                                      return Text(
                                        int.parse(snapshot.data) > 200
                                            ? 'Waste level is ${snapshot.data}'
                                            : 'Waste level is ${snapshot.data} . Please check',
                                        style: TextStyle(color: Colors.red),
                                      );
                                    }),
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
                                      child: Icon(Icons.map,
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
                                      child: Icon(Icons.location_city,
                                          size: 25, color: Colors.white)),
                                ),
                                title: Text('Apartment',
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
                                        data['apartment'].toString(),
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
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, CollectionPage.routeName);
                        },
                        child: Text(
                          'Request for collection',
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

  //function to get user data from thingspeak

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

  Future<String> getFirstSensorData() async {
    var url =
        "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2";
    var response = await http.get(Uri.parse(url));

    Channel channelData = channelFromMap(response.body);

    List<Feed> feedData = channelData.feeds;

    String data1 = feedData[0].field1;
    return data1;
    // if (response.statusCode == 200) {
    // } else {
    //   throw Exception("failed to fetch data from thingspeak");
    // }
  }
}

//function to sign out

Future<void> signOut() async {
  User? user = FirebaseAuth.instance.currentUser;
  await FirebaseAuth.instance
      .signOut()
      .then((value) => user = FirebaseAuth.instance.currentUser)
      .then((value) {
    MaterialPageRoute(builder: ((context) => MainScreen()));
  });
}

// this class sets the bottom navigation bar to allow easier switching between different pages and screens
class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex = 0;
  final _pages = [HomePage(), CollectorsPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.grey[300],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => currentIndex = index),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Collectors'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
