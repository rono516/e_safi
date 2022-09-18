// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/exercise_title.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  static const routeName = '/collection_page';

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = FirebaseAuth.instance.currentUser!.uid;
  bool _error = false;
  // Future<dynamic> startTransaction(
  //     {required double amount, required String? phone}) async {
  //   dynamic transactionInitialisation;
  //   //Wrap it with a try-catch
  //   try {
  //     //Run it
  //     transactionInitialisation =
  //         await MpesaFlutterPlugin.initializeMpesaSTKPush(
  //             businessShortCode:
  //                 "174379", //use your store number if the transaction type is CustomerBuyGoodsOnline
  //             transactionType: TransactionType
  //                 .CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
  //             amount: amount.toDouble(),
  //             partyA: phone.toString(),
  //             partyB: "174379",
  //             callBackURL: Uri(
  //               scheme: "https",
  //               // host: "my-app.herokuapp.com",
  //               //  path: "/callback",
  //               host: 'us-central1-nigel-da5d1.cloudfunctions.net',
  //               path: "paymentCallback",
  //             ),
  //             accountReference: "payment",
  //             phoneNumber: phone.toString(),
  //             baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
  //             transactionDesc: "paycollection",
  //             passKey:
  //                 "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

  //     // HashMap result = transactionInitialisation as HashMap<String, dynamic>;

  //     print("Result" + transactionInitialisation.toString());
  //   } catch (e) {
  //     // Other 'throws':
  //     // Amount being less than 1.0
  //     // Consumer Secret/Key not set
  //     // Phone number is less than 9 characters
  //     // Phone number not in international format(should start with 254 for KE)
  //     //

  //     // print(e.getMessage());
  //     print('Error $e');
  //   }
  // }

  // Future<void> startCheckout(
  //     {required String userPhone, required double amount}) async {
  //   //Preferably expect 'dynamic', response type varies a lot!
  //   dynamic transactionInitialisation;
  //   //Better wrap in a try-catch for lots of reasons.
  //   try {
  //     //Run it
  //     transactionInitialisation =
  //         await MpesaFlutterPlugin.initializeMpesaSTKPush(
  //             businessShortCode: "174379",
  //             transactionType: TransactionType.CustomerPayBillOnline,
  //             amount: amount,
  //             partyA: userPhone,
  //             partyB: "174379",
  //             // callBackURL: Uri(
  //             //     scheme: "https",
  //             //     host: "mpesa-requestbin.herokuapp.com",
  //             //     path: "/ruitm5ru"),
  //             callBackURL: Uri(
  //                 scheme: "https", host: "1234.1234.co.ke", path: "/1234.php"),
  //             accountReference: "payment",
  //             phoneNumber: userPhone,
  //             baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
  //             transactionDesc: "paycollection",
  //             passKey:
  //                 //"gy42MaHb1U+zPOUn287qfcwjqlAdIqwmokjZ4MHTKQELotCjF6WiyCSo1JbEK/sCmf6MWaiWOFybDgz9vTIIwrhhDs3RMm9yNRxJmybwCzpMkTlSrpXMUIlBK0u7+p/lrr4khqfiqXyNQ3gcFHgxHMIuUtZ1W8IRgolUDrYsjwyfTPC3yD/R89MNgMQxZyKkkszJcQ9x+R5d7uxPdFQQT1lV+zbbMLjZidCqCRnBuk8g+4KvUPM3eQNDAFYLuZufRSkRn0EHE+WEblBBeT8nqJrz/kIlyUeFIcbCyjHo/kiBjRhJAd3r3DxsfvqthXcTPpORfLBdmIGl/wS5ArFziQ=="
  //               "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"
  //             );
  //     //Test credential
  //     //

  //     //http://mpesa-requestbin.herokuapp.com/ruitm5ru
  //     print("TRANSACTION RESULT: " + transactionInitialisation.toString());

  //     //You can check sample parsing here -> https://github.com/keronei/Mobile-Demos/blob/mpesa-flutter-client-app/lib/main.dart

  //     /*Update your db with the init data received from initialization response,
  //     * Remaining bit will be sent via callback url*/
  //     return transactionInitialisation;
  //   } catch (e) {
  //     //For now, console might be useful
  //     print("CAUGHT EXCEPTION: " + e.toString());
  //   }
  // }

  Future<void> startCheckout(
      {required String userPhone, required double amount}) async {
    //Preferably expect 'dynamic', response type varies a lot!
    dynamic transactionInitialisation;
    //Better wrap in a try-catch for lots of reasons.
    try {
      //Run it
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: "174379",
              transactionType: TransactionType.CustomerPayBillOnline,
              amount: amount,
              partyA: userPhone,
              partyB: "174379",
              callBackURL: Uri(
                scheme: "https",
                // host: "mpesa-requestbin.herokuapp.com",
                host: "1234.1234.co.ke",
                // path: "/ruitm5ru",
                path: "/1234.php",
              ),
              accountReference: "shoe",
              phoneNumber: userPhone,
              baseUri: Uri(
                scheme: "https",
                host: "sandbox.safaricom.co.ke",
              ),
              transactionDesc: "purchase",
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());

      //You can check sample parsing here -> https://github.com/keronei/Mobile-Demos/blob/mpesa-flutter-client-app/lib/main.dart

      /*Update your db with the init data received from initialization response,
      * Remaining bit will be sent via callback url*/
      return transactionInitialisation;
    } catch (e) {
      //For now, console might be useful
      print("CAUGHT EXCEPTION: " + e.toString());

      /*
      Other 'throws':
      1. Amount being less than 1.0
      2. Consumer Secret/Key not set
      3. Phone number is less than 9 characters
      4. Phone number not in international format(should start with 254 for KE)
       */
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
                          WasteTile(
                              dataTitle: 'Current bin level',
                              icon: Icons.transform_sharp,
                              number: 16),
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
                                // trailing: Icon(Icons.more_horiz),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),
                    FloatingActionButton(
                        child: Icon(Icons.payment),
                        onPressed: () {
                          if (_error) {
                            print(_error);
                            return;
                          }
                          startCheckout(userPhone: "254792009556", amount: 1);
                        })
                    // TextButton(
                    //     onPressed: () {
                    //       startCheckout(userPhone: "254792009556", amount: 1);
                    //       // startCheckout(userPhone: "254792009556", amount: 1);
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
