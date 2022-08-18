// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:wasteapp/mpesakeys/keys.dart';
import 'package:wasteapp/pages/collection_page.dart';
import 'package:wasteapp/pages/collection_register.dart';
import 'package:wasteapp/pages/register.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'pages/auth_page.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

// void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MpesaFlutterPlugin.setConsumerKey(KConsumerKey);
  MpesaFlutterPlugin.setConsumerSecret(KConsumerSecret);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AuthScreen(),
      // home: CollectionPage(),
      // home: HomePage(),
      // home: CollectionRegister(),
      home: Register(),
      debugShowCheckedModeBanner: false,
      routes: {
        CollectionPage.routeName: (context) => CollectionPage(),
      },
    );
  }
}
