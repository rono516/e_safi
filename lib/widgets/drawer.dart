// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:wasteapp/pages/collection_register.dart';
import 'package:wasteapp/pages/home_page.dart';
import 'package:wasteapp/pages/main_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green[500],
        child: ListView(children: [
          ListTile(
            title: const Text(
              'Esafi',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => const BottomNavigationPage()));
            },
          ),
          ListTile(
            title: const Text(
              'Register for collection',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => const CollectionRegister()));
            },
          ),
          ListTile(
            title: const Text(
              'Collector',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => const MainScreen()));
            },
          )
        ]),
      ),
    );
  }
}
