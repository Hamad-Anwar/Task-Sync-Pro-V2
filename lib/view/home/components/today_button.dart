import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class TodayButton extends StatelessWidget {
  const TodayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: lightAccentBlue,
                offset: Offset(0, 5),
                blurRadius: 20
            )
          ],
          gradient:  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                lightAccentBlue,
                darkAccentBlue
              ]
          )
      ),
      child: Text(
        'Today',style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      ),
    );
  }
}