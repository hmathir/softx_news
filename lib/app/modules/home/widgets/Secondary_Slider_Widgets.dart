import 'package:flutter/material.dart';
import 'package:softx_news/app/modules/home/controllers/home_controller.dart';
import 'dart:math';

class SecondarySlider extends StatelessWidget {
  const SecondarySlider({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: 20,
          right: 6,
          bottom: 20,
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/source.png'),),),
                  Positioned(
                    child: Text(
                      'SoftX',
                      style: TextStyle(color: Colors.white,
                    ),
                  ),
                  )],
              ),
            ),
          );
        },
      ),
    );
  }
}
