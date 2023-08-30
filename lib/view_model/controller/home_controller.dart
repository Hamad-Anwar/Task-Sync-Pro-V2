import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/db_helper/dbHelper.dart';
import 'package:todo/util/utils.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController();
  final DbHelper db = DbHelper();
  final DateTime dateTime = DateTime.now();
  List<RxList> list=[
    [].obs,
    [].obs,
    [].obs,
    [].obs,
    [].obs,
    [].obs,
    [].obs,
  ];
  RxInt barIndex = 0.obs;
  RxList model = [].obs;

  getTasks() async {
    db.getData().then((value) {
      model.value = value;
      getSepreteLists();
    });
  }

  setIndex(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    currentIndex.value = value;
  }

  getDateAccordingTabs(int value){
    return '${Utils.addPrefix(dateTime.add(Duration(days: value)).day.toString())}/${Utils.addPrefix(dateTime.add(Duration(days: value)).month.toString())}/${Utils.addPrefix(dateTime.add(Duration(days: value)).year.toString())}';
  }

  getSepreteLists(){
    List<RxList<dynamic>> tempList=[];
    for(int i=0;i<7;i++){
      RxList tempList1=[].obs;
      tempList1.clear();
      for(int j=0;j<model.length;j++){
        if(model[j].date==getDateAccordingTabs(i)){
          tempList1.add(model[j]);
        }
      }
      tempList.add(tempList1);
    }
    list=tempList;
  }









}
