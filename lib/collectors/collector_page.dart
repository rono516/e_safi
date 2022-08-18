import 'package:flutter/material.dart';

class CollectorPgae extends StatelessWidget {
  const CollectorPgae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the collector page'),
      ),
      body: const Center(
        child: Text('Tenant\'s collection data'),
      ),
    );
  }
}
