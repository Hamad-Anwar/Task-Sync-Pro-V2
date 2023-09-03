import 'package:flutter/material.dart';

import '../../sign in/components/back_button.dart';
class SignUpBar extends StatelessWidget {
  const SignUpBar({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Row(
      children: [
        CustomBackButton(),
        SizedBox(
          width: 20,
        ),
        Text(
          'Sign up',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.orange),
        )
      ],
    );
  }
}
