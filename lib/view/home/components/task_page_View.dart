import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/components/task_list.dart';

import '../../../view_model/controller/home_controller.dart';

class TaskPageView extends StatelessWidget {
  TaskPageView({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children:  const [
        TaskList(index: 0,),
        TaskList(index: 1,),
        TaskList(index: 2,),
        TaskList(index: 3,),
        TaskList(index: 4,),
        TaskList(index: 5,),
        TaskList(index: 6,),
      ],
    );
  }
}