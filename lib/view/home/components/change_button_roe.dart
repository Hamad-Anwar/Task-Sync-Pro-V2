import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/components/today_button.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import '../../../res/constants.dart';
import 'change_icon.dart';
class ChangeButtonRow extends StatelessWidget {
   ChangeButtonRow({super.key});
   final controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.06),
      child:  Row(
        children: [
          TodayButton(),
          Spacer(),
          InkWell(
              onTap: () => controller.onMoveBack(),
              child: ChangeIconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 15,))),
          SizedBox(width: defaultPadding/2,),
          InkWell(
              onTap: () => controller.onMoveNextPage(),
              child: ChangeIconButton(icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,))),
        ],
      ),
    );
  }
}


