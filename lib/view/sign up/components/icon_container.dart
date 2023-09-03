import 'package:flutter/material.dart';
import 'package:todo/res/constants.dart';
class IconContainer extends StatelessWidget {
  final Widget widget;
  const IconContainer({super.key, required this.widget});
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Container(
      height: 60,
      width: size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
        border: Border.all(
          color: darkOrange
        ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: lightOrange,
                offset: const Offset(1,0)
            ),
            BoxShadow(
                color: lightOrange,
                offset: const Offset(0,1)
            ),
            BoxShadow(
                color: lightOrange,
                offset: const Offset(-1,0)
            ),
            BoxShadow(
                color: lightOrange,
                offset: const Offset(0,-1)
            ),
          ]
      ),
      child: widget,
    );
  }
}
