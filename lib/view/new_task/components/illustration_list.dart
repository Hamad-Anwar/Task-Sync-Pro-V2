import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/util/utils.dart';
import 'package:todo/view_model/controller/new_task_controller.dart';
import '../../../res/constants.dart';

class SelectImageList extends StatelessWidget {
  SelectImageList({super.key});
  final controller=Get.put(NewTaskController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 4,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  lightOrange,
                  darkOrange
                ])
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text('Illustrations',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.changeImage(index);
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Obx(() => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: controller.selectedImage.value==index? const LinearGradient(
                                    colors: [
                                      lightAccentBlue,
                                      lightAccentBlue,
                                    ]
                                ): null,
                                boxShadow: controller.selectedImage.value==index ? const [
                                  BoxShadow(
                                    color: lightAccentBlue,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ] : null
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Image.asset(Utils.images['$index'],height: 80,width: 80,))),),
                        Obx(() => controller.selectedImage.value==index ? const Icon(Icons.keyboard_arrow_up,color: Colors.orange) : const SizedBox(),)
                      ],
                    )),
              );
            },),
        ),
      ],
    );
  }
}