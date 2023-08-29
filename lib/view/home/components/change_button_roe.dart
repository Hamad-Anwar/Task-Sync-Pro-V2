
import 'package:flutter/material.dart';
import 'package:todo/view/home/components/today_button.dart';

import '../../../res/constants.dart';
import 'change_icon.dart';

class ChangeButtonRow extends StatelessWidget {
  const ChangeButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.06),
      child: const Row(
        children: [
          TodayButton(),
          Spacer(),
          ChangeIconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 15,)),
          SizedBox(width: defaultPadding/2,),
          ChangeIconButton(icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,)),
        ],
      ),
    );
  }
}


