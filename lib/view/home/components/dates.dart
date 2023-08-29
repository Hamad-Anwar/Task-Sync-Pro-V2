import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/utils.dart';
import '../../../view_model/controller/home_controller.dart';

class Dates extends StatelessWidget {
  Dates({super.key, required this.index});
  final int index;
  final controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(Utils.getMonth(DateTime.now().add(Duration(days: index))),
          style: TextStyle(
              color: controller.currentIndex.value==index ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              height: 0
          ),
        ),),
        Obx(() => Text(Utils.getDate(DateTime.now().add(Duration(days: index))),
          style: TextStyle(
              color: controller.currentIndex.value==index ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
              height: 0
          ),
        ),),
        Obx(() => Text(Utils.getDay(DateTime.now().add(Duration(days: index))),
          style: TextStyle(
              color: controller.currentIndex.value==index ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13
          ),
        ),)
      ],
    );
  }
}