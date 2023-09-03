import 'package:flutter/material.dart';
import 'package:todo/res/constants.dart';
class TextFieldSufix extends StatelessWidget {
  const TextFieldSufix({super.key, required this.icon,this.size=18});
  final IconData icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors:[
                lightOrange,
                darkOrange,
                darkOrange,
              ]
            ),
            boxShadow: const [
              BoxShadow(
                  color: lightOrange,
                  offset: Offset(1, 0)),
              BoxShadow(
                  color: lightOrange,
                  offset: Offset(0, 1)),
              BoxShadow(
                  color: lightOrange,
                  offset: Offset(-1, 0)),
              BoxShadow(
                  color: lightOrange,
                  offset: Offset(0, -1)),
            ]),
        child:  Icon(
          icon,
          color: Colors.white70,
          size: size,
        ),
      ),
    );
  }
}
