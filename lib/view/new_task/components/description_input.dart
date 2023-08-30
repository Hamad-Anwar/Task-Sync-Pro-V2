import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/new_task/components/text_input.dart';
import 'package:todo/view_model/controller/new_task_controller.dart';
import '../../../res/constants.dart';

class DescriptionInput extends StatelessWidget {
  final controller=Get.put(NewTaskController());
   DescriptionInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultPadding/2,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Description',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          Obx(() => TextInputField(
            controller: controller.description.value,
            hint: 'Description (Optional)',
            focus: controller.descriptionFocus.value,
            onTap: ()=>controller.setDescriptionFocus(),))
        ],
      ),
    );
  }
}