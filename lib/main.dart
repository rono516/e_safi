// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:wasteapp/collectors/collector_initiate.dart';
import 'package:wasteapp/pages/collection_page.dart';
import 'package:wasteapp/pages/login.dart';
import 'package:wasteapp/pages/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wasteapp/pages/requests_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AuthScreen(),
      // home: CollectionPage(),
      // home: HomePage(),
      // home: CollectionRegister(),
      // home: Register(),  Latest
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        CollectionPage.routeName: (context) => CollectionPage(),
        LoginPage.routeName: (context) => LoginPage(),
        MainScreen.routeName: (context) => MainScreen(),
        CollectorInitiate.routeName: (context) => CollectorInitiate(),
        RequestsPage.routeName: (context) => RequestsPage()
      },
    );
  }
}
