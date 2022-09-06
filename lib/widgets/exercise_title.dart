// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WasteTile extends StatelessWidget {
  final icon;
  final String dataTitle;
  final int number;
  const WasteTile(
      {Key? key,
      required this.icon,
      required this.dataTitle,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                padding: EdgeInsets.all(6),
                color: Colors.orange,
                child: Icon(icon, size: 25, color: Colors.white)),
          ),
          title: Text(dataTitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(
            '$number Exercises',
            style: TextStyle(color: Colors.grey),
          ),
          // trailing: Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
