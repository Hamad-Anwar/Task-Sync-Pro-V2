import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/home.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import 'package:todo/view_model/controller/new_task_controller.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  final homeController=Get.put(HomeController());
  final newTaskController=Get.put(NewTaskController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getTasks();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('TASK MANAGER',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
