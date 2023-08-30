
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/res/constants.dart';
class Utils{

    static String getMonth(DateTime date){
      String formattedDate = DateFormat('MMM').format(date);
      return formattedDate;
    }
    static String getDate(DateTime date){
      String formattedDate = DateFormat('d').format(date);
      if(formattedDate.length==1){
        formattedDate='0$formattedDate';
      }
      return formattedDate;
    }
    static String getDay(DateTime date){
      String formattedDate = DateFormat('EEE').format(date);
      return formattedDate;
    }
    static String addPrefix(String string){
      if(string.length==1){
        string='0$string';
      }
      return string;
    }



    static void showSnackBar(String title,String message,Widget icon){
      Get.showSnackbar(
          GetSnackBar(
            backgroundColor: darkestBlue,
            title: title,
            isDismissible: true,
            duration: const Duration(milliseconds: 2000),
            icon: icon,
            message: message,
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          )
      );
    }


}