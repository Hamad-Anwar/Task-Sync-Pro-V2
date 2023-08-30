import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';
import '../../../util/utils.dart';
import '../../../view_model/controller/home_controller.dart';

class TaskTitle extends StatelessWidget {
  TaskTitle({super.key, required this.index, required this.ind});
  final int index;
  final int ind;
  final int randomColor1=Random().nextInt(9);
  final int randomColor2=Random().nextInt(9);
  final  controller =Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(
          controller.list[ind][index].title,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Text(
          '${controller.list[ind][index].startTime} - ${controller.list[ind][index].endTime}',
          style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              fontSize: 12),
        ),
        const SizedBox(height: defaultPadding/2,),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              decoration: BoxDecoration(
                color: Utils.colors[randomColor1].withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Text(Utils.tags[Random().nextInt(13)],style: TextStyle(color: Utils.colors[randomColor1]),),
            ),
            const SizedBox(width: defaultPadding/2,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              decoration: BoxDecoration(
                  color: Utils.colors[randomColor2].withOpacity(.5),
                  borderRadius: BorderRadius.circular(10)
              ),
              child:  Text(Utils.tags[Random().nextInt(13)],style: TextStyle(color: Utils.colors[randomColor2]),),
            )
          ],
        ),
      ],
    );
  }
}
