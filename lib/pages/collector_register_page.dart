import 'package:flutter/material.dart';

class CollectorRegister extends StatefulWidget {
  const CollectorRegister({Key? key}) : super(key: key);

  @override
  State<CollectorRegister> createState() => _CollectorRegisterState();
}

class _CollectorRegisterState extends State<CollectorRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collector Register'),
      ),
      body: const SafeArea(
          child: Center(
        child: Text('Collector Register here'),
      )),
    );
  }
}
