import 'package:flutter/material.dart';
import 'package:todo/res/constants.dart';
import 'package:todo/view_model/responsive.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        tablet: Grid(crossAsis: 2, ratio: 3),
        mobile: Grid(
          ratio: 3,
          crossAsis: 1,
        ));
  }
}




class Grid extends StatelessWidget {
  final int crossAsis;
  final double ratio;
  const Grid({super.key, required this.crossAsis, required this.ratio});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 40),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAsis, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Image.asset(
                'assets/images/study.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(width: defaultPadding,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Design Study',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    '10:00 AM - 12:00 AM',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                  const SizedBox(height: defaultPadding/2,),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                        decoration: BoxDecoration(
                          color: lightAccentBlue.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Study',style: TextStyle(color: darkAccentBlue),),
                      ),
                      const SizedBox(width: defaultPadding/2,),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                        decoration: BoxDecoration(
                            color: lightOrange.withOpacity(.5),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text('Productive',style: TextStyle(color: darkOrange),),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
             index%2==1? Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      lightOrange,
                      darkOrange,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: lightOrange,
                      offset: Offset(0, 10),
                      blurRadius: 10
                    )
                  ]
                ),
                child: const Icon(Icons.done,color: Colors.white,),
              ):
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey,
                  ),
                ),
              )

              ,

            ],
          ),
        );
      },
    );
  }
}
