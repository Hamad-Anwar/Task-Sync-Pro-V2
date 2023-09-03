import 'package:flutter/material.dart';
import 'package:todo/view/home/components/back_decoration.dart';
import 'package:todo/view_model/responsive.dart';

import 'components/signin_body.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
         BackColors(),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: !Responsive.isTablet(context)?  CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                if(Responsive.isTablet(context)) SizedBox(width: 60,),
                Expanded(child: SignInBody()),
                if(Responsive.isTablet(context)) Expanded(child: Image.asset(
                    'assets/images/2.png'
                )),
              ],
            ),
          ),
        ],
      )
    );
  }
}
