

import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class PeriorityContainer extends StatelessWidget {
  final String text;
  final bool selected;

  const PeriorityContainer(
      {super.key, required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(selected ? 3 : 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: selected ? Colors.orange : Colors.black12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(color: darkAccentBlue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}