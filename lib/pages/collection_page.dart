// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_print

import 'package:flutter/material.dart';
import '../widgets/exercise_title.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  static const routeName = '/collection_page';

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
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

  Future<void> startCheckout(
      {required String userPhone, required double amount}) async {
    //Preferably expect 'dynamic', response type varies a lot!
    dynamic transactionInitialisation;
    //Better wrap in a try-catch for lots of reasons.
    try {
      //Run it
      transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: amount,
          partyA: userPhone,
          partyB: "174379",
          callBackURL:
              Uri(scheme: "https", host: "1234.1234.co.ke", path: "/1234.php"),
          accountReference: "payment",
          phoneNumber: userPhone,
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "paycollection",
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
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          startCheckout(userPhone: "254792009556", amount: 10);
                        },
                        child: Text(
                          'Pay Now',
                          style: TextStyle(color: Colors.green),
                        ))
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
