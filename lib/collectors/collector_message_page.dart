import 'package:flutter/material.dart';

class CollectorMessage extends StatefulWidget {
  const CollectorMessage({Key? key}) : super(key: key);

  @override
  State<CollectorMessage> createState() => _CollectorMessageState();
}

class _CollectorMessageState extends State<CollectorMessage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
