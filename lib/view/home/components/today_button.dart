import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view_model/controller/home_controller.dart';

import '../../../res/constants.dart';

class TodayButton extends StatelessWidget {
  const TodayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeController());
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => controller.pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn),
      child: Container(
        height: 50,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  color: lightAccentBlue,
                  offset: Offset(0, 5),
                  blurRadius: 20
              )
            ],
            gradient:  const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  lightAccentBlue,
                  darkAccentBlue
                ]
            )
        ),
        child: const Text(
          'Today',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}