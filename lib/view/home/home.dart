import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/res/constants.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import 'components/back_decoration.dart';
import 'components/bottom_nav_bar.dart';
import 'components/floating_action.dart';
import 'components/task_page_holder.dart';
import 'components/upper_body.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const BackColors(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UperBody(),
                const Expanded(
                  child: TaskPageBody(),
            ),
                BottomNavBar(),
          ],
        ),
        ]
      )
    )
    );
  }
}



