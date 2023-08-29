import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class ChangeIconButton extends StatelessWidget {
  const ChangeIconButton({super.key, required this.icon});
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: neviBlue,
          boxShadow: [
            BoxShadow(
                color: neviBlue.withOpacity(.3),
                offset: Offset(0, 10),
                blurRadius: 10
            )
          ]
      ),
      child: icon,
    );
  }
}
