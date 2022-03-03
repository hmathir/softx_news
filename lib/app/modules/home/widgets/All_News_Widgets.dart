import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class AllNewsWidgets extends StatelessWidget {
  const AllNewsWidgets({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.news.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/BBC.png',
                    height: 70,
                    width: 70,

                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.news[index]['title']),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
