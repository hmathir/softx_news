import 'package:flutter/material.dart';


// ignore: must_be_immutable
class SecondarySlider extends StatelessWidget {
SecondarySlider({this.controller});
var controller;


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
        itemCount: controller.source.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      child: Text(controller.source[index]['name']),),],
              ),
            ),
          );
        },
      ),
    );
  }
}
