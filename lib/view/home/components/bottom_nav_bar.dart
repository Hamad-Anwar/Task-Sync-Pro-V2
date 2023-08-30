import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/controller/home_controller.dart';
class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>AnimatedBottomNavigationBar(
      elevation: 10,
      height: 60,
      inactiveColor: Colors.grey,
      activeColor: Colors.orange,
      icons: const [
        Icons.home_max,
        Icons.ac_unit,
        Icons.edit_note_sharp,
        Icons.person_outline_rounded
      ],
      activeIndex: controller.barIndex.value,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index){controller.barIndex.value=index;},
      //other params
    ),);
  }
}
