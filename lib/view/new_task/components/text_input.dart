import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';
import '../../../view_model/controller/new_task_controller.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool focus;
  final VoidCallback onTap;
   TextInputField(
      {super.key,
        required this.controller,
        required this.hint,
        required this.focus, required this.onTap});
  final taskController=Get.put(NewTaskController());
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(focus ? 2 : 1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: focus ? darkOrange : Colors.grey),
      child: TextFormField(
        controller: controller,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
          taskController.onTapOutside();
        },
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}