import 'package:flutter/material.dart';
import 'package:todo/view/home/components/back_decoration.dart';
import 'package:todo/view_model/responsive.dart';
import 'components/signup_body.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackColors(),
          SafeArea(
            child: Row(
              children: [
               if(Responsive.isTablet(context)) SizedBox(width: 60,),
                Expanded(child: SignupBody()),
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
