// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'collection_page.dart';
import '../widgets/exercise_title.dart';
// import './pages/collection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: SafeArea(
        // child: Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                    Text(
                      'Hi, Collins!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8), //space between texts
                    Text('June 16, 2022',
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
                    child: Icon(Icons.notifications, color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(),

          //how do you feel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your next collection date is:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                // Icon(Icons.more_horiz, color: Colors.white)
                Text('June 30, 2022',
                    style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ],
            ),
          ),

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current waste profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        //
                        // style: TextStyle(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 20),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    SizedBox(height: 20),
                    //fgg

                    //ListView of exercises
                    Expanded(
                      child: ListView(
                        children: [
                          ExerciseTitle(
                              exerciseTitle: 'Bins available',
                              //,,
                              icon: Icons.numbers_outlined,
                              number: 5),
                          SizedBox(height: 5),
                          ExerciseTitle(
                              exerciseTitle: 'Current bin level',
                              icon: Icons.transform_sharp,
                              number: 16),
                          SizedBox(height: 5),
                          ExerciseTitle(
                              exerciseTitle: 'Bin location',
                              icon: Icons.location_city,
                              number: 34),
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
                          // Navigator.of(context).pushNamed(Collection);
                          Navigator.pushNamed(
                              context, CollectionPage.routeName);
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
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
      ]),
    );
  }
}
//,,
