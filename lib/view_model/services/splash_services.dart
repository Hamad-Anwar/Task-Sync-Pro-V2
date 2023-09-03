import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/view/home/home.dart';

import '../../view/sign up/sign_up.dart';
import '../controller/home_controller.dart';
import '../controller/new_task_controller.dart';

class SplashServices{
  static void checkLogin()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? uid=pref.getString('TOKEN');
    Timer(const Duration(milliseconds: 2000), () {
      if(uid==null){
        Get.to(SignUp());
      }else{
        final homeController=Get.put(HomeController());
        final newTaskController=Get.put(NewTaskController());
        homeController.getTasks();
        Get.to(HomePage());
      }
    });

  }
}