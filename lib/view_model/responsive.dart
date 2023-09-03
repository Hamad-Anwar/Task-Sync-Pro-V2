import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key, required this.tablet, required this.mobile, required this.largeTablet});
  final Widget tablet;
  final Widget mobile;
  final Widget largeTablet;

  static bool isTablet(BuildContext context){
    return MediaQuery.sizeOf(context).width>500;
  }

  static bool isLargeTablet(BuildContext context){
    return MediaQuery.sizeOf(context).width>1000;
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    if(size.width >1000){
      return largeTablet;
    }
    else if(size.width >500){
      return tablet;
    }else{
      return mobile;
    }
  }
}
