import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key, required this.tablet, required this.mobile});
  final Widget tablet;
  final Widget mobile;

  static bool isTablet(BuildContext context){
    return MediaQuery.sizeOf(context).width>500;
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    if(size.width >500){
      return tablet;
    }else{
      return mobile;
    }
  }
}
