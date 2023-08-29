import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt currentIndex=0.obs;

  setIndex(int value){
    currentIndex.value=value;
  }
}