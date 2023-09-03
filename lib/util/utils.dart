
import 'package:email_validator/email_validator.dart';
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
   static Map<String,dynamic> images={
      '0': 'assets/images/1.png',
      '1': 'assets/images/2.png',
      '2': 'assets/images/3.png',
      '3': 'assets/images/4.png',
      '4': 'assets/images/5.png',
      '5': 'assets/images/6.png',
      '6': 'assets/images/7.png',
      '7': 'assets/images/8.png',
      '8': 'assets/images/9.png',
      '9': 'assets/images/10.png',
    };
    static List<Color> colors=[
      lightBlue,
      lightAccentBlue,
      darkAccentBlue,
      darkOrange,
      lightOrange,
      Colors.pinkAccent,
      Colors.purpleAccent,
      Colors.greenAccent,
      neviBlue,
      Colors.tealAccent
    ];
   static List<String> tags = [
      'Study',
      'Productive',
      'Work',
      'Personal',
      'Health',
      'Home',
      'Errands',
      'Social',
      'Finance',
      'Hobby',
      'Family',
      'Self-care',
      'Tech',
      'Creative',
    ];

    static Future<bool> showWarningDialog(BuildContext context,String title,String msg,String button,VoidCallback onConfirm) async {
       bool confirmed=false;
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:  Text(title),
            content:  Text(msg),
            actions: [
              TextButton(
                child: const Text('Cancel',style: TextStyle(color: Colors.black),),
                onPressed: () {
                  Navigator.of(context).pop();
                  confirmed=false;
                },
              ),
              TextButton(
                child:  Text(button,style: TextStyle(color: Colors.orange),),
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context);
                  confirmed=true;
                },
              ),
            ],
          );
        },
      );
      return confirmed;
    }


    static bool validateEmail(String email){
      return EmailValidator.validate(email);
    }
    static String extractFirebaseError(String error){
      return error.substring(error.indexOf(']')+1);
    }

}