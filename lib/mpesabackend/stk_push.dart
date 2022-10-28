import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wasteapp/models/channel.dart';

class StkPush {
  final _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String baseUrl = "http://10.0.2.2:8000/tests/stk-push/success";

  Future getStkPush() async {
    try {
      await http.get(Uri.parse(baseUrl)).then((value) async {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        User? user = _auth.currentUser;
        // uid = user.uid
        await firebaseFirestore.collection("requests").doc(user!.uid).set({
          'Date': DateTime.parse(DateTime.now().toString()),
          'Bin level': getSensorData()
        });

        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => RequestsPage()));
      });

      // if (response.statusCode == 200) {
      //   return 'Please validate to make payment';
      // } else {
      //   return 'ff';
      // }
    } catch (error) {
      print('Error : $error');
    }
    return const CircularProgressIndicator();
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
