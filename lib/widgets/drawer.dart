// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:wasteapp/pages/collection_register.dart';
import 'package:wasteapp/pages/home_page.dart';
import 'package:wasteapp/pages/message_page.dart';
import 'package:wasteapp/pages/profile_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.green[500],
      // ignore: prefer_const_literals_to_create_immutables
      child: ListView(children: [
        // ignore: prefer_const_constructors
        ListTile(
          title: const Text(
            'Home Page',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => const BottomNavigationPage()));
            // Navigator.of(context).pushNamed(MessagePage.routeName);
            // Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text(
            'Message Page',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => const MessagePage()));
          },
        ),
        ListTile(
          title: const Text(
            'Profile Page',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
            // Navigator.of(context).pushNamed(ProfilePage.routeName);
            // Navigator.of(context).pop();
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
        // TextButton(
        //     onPressed: () =>
        //         Navigator.of(context).pushNamed(MessagePage.routeName),
        //     child: const Text('Message Page',
        //         style: TextStyle(color: Colors.white, fontSize: 18))),
        // TextButton(
        //     onPressed: () =>
        //         Navigator.of(context).pushNamed(ProfilePage.routeName),
        //     child: const Text('Profile Page',
        //         style: TextStyle(color: Colors.white, fontSize: 18)))
      ]),
    ));
  }
}
