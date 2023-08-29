import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import 'components/back_decoration.dart';
import 'components/change_button_roe.dart';
import 'components/task_list.dart';
import 'components/upper_body.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const BackColors(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UperBody(),
                Expanded(
                    child: Stack(
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
                      child: TaskList(),
                    )),
                    const ChangeButtonRow(),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
