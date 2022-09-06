// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_print

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:wasteapp/pages/home_page.dart';
import '../widgets/exercise_title.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  static const routeName = '/collection_page';

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  Future<dynamic> startTransaction(
      {required double amount, required String? phone}) async {
    dynamic transactionInitialisation;
    //Wrap it with a try-catch
    try {
      //Run it
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode:
                  "174379", //use your store number if the transaction type is CustomerBuyGoodsOnline
              transactionType: TransactionType
                  .CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
              amount: amount,
              partyA: phone.toString(),
              partyB: "174379",
              callBackURL: Uri(
                scheme: "https",
                host: "1234.1234.co.ke",
                path: "/1234.php",
                // host:
                //     'us-central1-nigel-da5d1.cloudfunctions.net/paymentCallback',
              ),
              accountReference: "payment",
              phoneNumber: phone.toString(),
              baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
              transactionDesc: "paycollection",
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

      // HashMap result = transactionInitialisation as HashMap<String, dynamic>;

      print("Result" + transactionInitialisation.toString());
    } catch (e) {
      //you can implement your exception handling here.
      //Network un-reachability is a sure exception.

      /*
    Other 'throws':
    1. Amount being less than 1.0
    2. Consumer Secret/Key not set
    3. Phone number is less than 9 characters
    4. Phone number not in international format(should start with 254 for KE)
     */

      // print(e.getMessage());
    }
  }

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
                          'Initiate Collection',
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
                          WasteTile(
                              dataTitle: 'Bins available',
                              icon: Icons.numbers_outlined,
                              number: 5),
                          SizedBox(height: 5),
                          WasteTile(
                              dataTitle: 'Current bin level',
                              icon: Icons.transform_sharp,
                              number: 16),
                          SizedBox(height: 5),
                          WasteTile(
                              dataTitle: 'Bin location',
                              icon: Icons.location_city,
                              number: 34),
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
                    FloatingActionButton(
                        onPressed: () {
                          startTransaction(amount: 10.0, phone: "254792009556");
                        },
                        child: Text('Pay Now')),
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
