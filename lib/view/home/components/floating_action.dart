import 'package:flutter/material.dart';
import 'package:todo/view/new_task/new_task.dart';

import '../../../res/constants.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        showModalBottomSheet(
          elevation: 0,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          context: context, builder: (context) {
          return  NewTask();
        },);
      },
      child: Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(top: 10,bottom: 10),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              lightAccentBlue,
              darkAccentBlue,
              darkAccentBlue
            ])
        ),
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}