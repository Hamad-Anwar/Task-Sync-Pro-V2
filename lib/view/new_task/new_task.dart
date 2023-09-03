import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/res/constants.dart';
import 'package:todo/view/new_task/components/task_button.dart';
import 'package:todo/view_model/controller/new_task_controller.dart';
import 'package:todo/view_model/responsive.dart';
import '../home/components/back_decoration.dart';
import 'components/category_input.dart';
import 'components/date_time.dart';
import 'components/description_input.dart';
import 'components/illustration_list.dart';
import 'components/lable_input.dart';

class NewTask extends StatelessWidget {
  NewTask({super.key});

  final controller = Get.put(NewTaskController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(30)),
      child: Container(
          height: 650,
          width:  Responsive.isLargeTablet(context) ?MediaQuery.sizeOf(context).width/2.5 : Responsive.isTablet(context)? MediaQuery.sizeOf(context).width/1.6 : MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                  child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectImageList(),
                          LabelInput(),
                          CategoryInput(),
                          DescriptionInput(),
                           DateTimeInput(),
                        ],
                      ),
                    ),
                  ),
                   GestureDetector(
                      onTap: () => controller.insertTask(context),
                       child: CreateTaskButton())
                ],
              ))
            ],
          )),
    );
  }
}


