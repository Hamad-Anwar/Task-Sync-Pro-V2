import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/db_helper/dbHelper.dart';
import 'package:todo/util/utils.dart';
import '../../data/shared pref/shared_pref.dart';

class HomeController extends GetxController {
  RxMap userData = {}.obs;
  RxString name = ''.obs;
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController();
  final DbHelper db = DbHelper();
  final DateTime dateTime = DateTime.now();
  Connectivity? connectivity;

  List<RxList> list=[
    [].obs,
    [].obs,
    [].obs,
    [].obs,
    [].obs,
    [].obs,
    [].obs,
  ].obs;
  RxInt barIndex = 0.obs;
  RxList model = [].obs;
  final ScrollController scrollController=ScrollController();


  HomeController(){
    if (userData['NAME'] == null) {
      getUserData();
    }
  }













  getUserData() async {
    userData.value = await UserPref.getUser();
    getName();
  }
  getName() {
    name.value = userData['NAME'];
  }

  getTasks() async {
    db.getData().then((value) {
      model.value = value;
      getSepretLists();
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
  getSepretLists(){
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
  onMoveNextPage(){
    if(currentIndex.value<7){
      setIndex(currentIndex.value+1);
    }
  }
  onMoveBack(){
    if(currentIndex.value>0){
      setIndex(currentIndex.value-1);
    }
  }
  onTaskComplete(int value,int index,int ind,String key,BuildContext context){
    switch(value){
      case 3: {
        Utils.showWarningDialog(context, 'Complete Task','This task will be marked as completed', 'Confirm', () {
          list[ind][index].status='complete';
          list[ind].add('');
          list[ind].remove('');
          db.update(key, 'status', 'complete');
        });
      }
      case 2:{
        Utils.showWarningDialog(context, 'Delete Task','Are you want to sure to remove', 'Confirm', () {
          list[ind].remove(list[ind][index]);
          db.delete(key, 'Tasks',);
        });
      }
    }
  }


}
