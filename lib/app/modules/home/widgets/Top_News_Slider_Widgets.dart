import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import 'dart:math';

class TopNewsSlider extends StatelessWidget {
  const TopNewsSlider({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20, right: 6, bottom: 20,),
        itemCount: controller.news.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 14),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 50,
                  left: 10,
                  right: 10,
                  child: Text(controller.news[index]['title']),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
