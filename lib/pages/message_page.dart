// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wasteapp/widgets/drawer.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);
  static const routeName = '/message_page';

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: Colors.green,
      // appBar: AppBar(title: Text('Message'), centerTitle: true),
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text('Send message to collection'),
              Text('In case of excess litter outside the bin')
            ],
          ),
        ),
      ),
    );
  }
}
