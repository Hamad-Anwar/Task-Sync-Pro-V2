import 'package:flutter/material.dart';
import 'package:todo/view/home/components/task_page_View.dart';

import 'change_button_roe.dart';

class TaskPageBody extends StatelessWidget {
  const TaskPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(.6),
                        Colors.white.withOpacity(.5),
                        Colors.white.withOpacity(.4),
                        Colors.white.withOpacity(.3),
                        Colors.white.withOpacity(.2),
                        Colors.white.withOpacity(.0),
                        Colors.white.withOpacity(.0),
                        Colors.white.withOpacity(.0),
                        Colors.white.withOpacity(.0),
                        Colors.white.withOpacity(.0),
                      ])),
              child:  TaskPageView(),
            )),
        ChangeButtonRow(),
      ],
    );
  }
}