import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasteapp/pages/main_screen.dart';

class CollectorPgae extends StatelessWidget {
  const CollectorPgae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the collector page'),
      ),
      body: const Center(
        child: TextButton(onPressed: signOut, child: Text('Logout')),
      ),
    );
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut().then((value) {
    MaterialPageRoute(builder: ((context) => const MainScreen()));
  });
}
