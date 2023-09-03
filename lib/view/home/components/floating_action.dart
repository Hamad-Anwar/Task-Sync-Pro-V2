import 'package:flutter/material.dart';
import 'package:todo/view/new_task/new_task.dart';
import 'package:todo/view_model/responsive.dart';

import '../../../res/constants.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        Responsive.isTablet(context)?

        showGeneralDialog
          (
          context: context,
          barrierLabel: "Barrier",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (_, __, ___) {
            return Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Material(
                  
                    child: NewTask()),
              ),
            );
          },
          transitionBuilder: (_, anim, __, child) {
            Tween<Offset> tween;

            tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

            return SlideTransition(
              position: tween.animate(
                CurvedAnimation(parent: anim, curve: Curves.easeInOut),
              ),
              // child: FadeTransition(
              //   opacity: anim,
              //   child: child,
              // ),
              child: child,
            );
          },
        )
            : showModalBottomSheet(
          elevation: 0,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          context: context, builder: (context) {
          return  NewTask();
        },);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              lightAccentBlue,
              darkAccentBlue,
              darkAccentBlue
            ])
        ),
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}