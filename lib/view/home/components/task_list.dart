import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/components/task_detail_container.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import 'package:todo/view_model/responsive.dart';
class TaskList extends StatelessWidget {
   const TaskList({super.key, required this.index});
   final int index;
  @override
  Widget build(BuildContext context) {
    return  Responsive(
        tablet: Grid(crossAsis: 2, ratio: 3,ind: index,),
        largeTablet: Grid(crossAsis: 3, ratio: 3,ind: index,),
        mobile: Grid(
          ratio: 3,
          crossAsis: 1,
          ind:index ,
        ));
  }
}



class Grid extends StatelessWidget {
  final int crossAsis;
  final double ratio;
 final int ind;
  final  controller =Get.put(HomeController());
   Grid({super.key, required this.crossAsis, required this.ratio, required this.ind});
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.list[ind].isEmpty ? const Center(
      child: Text('No Task Today',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
    ) :GridView.builder(
      padding: const EdgeInsets.only(top: 40),
      itemCount: controller.list[ind].length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAsis, childAspectRatio: ratio),
      itemBuilder: (context, index) {
          return TaskDetailContainer(index: index,ind: ind,);
      },
    ));
  }
}































