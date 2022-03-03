import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HotNewsWidgets extends StatelessWidget {
  const HotNewsWidgets({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 11, bottom: 16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(controller.news.length, (index) {
          return Container(
            margin: EdgeInsets.only(right: 5, bottom: 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Center(
                    child: Image.asset('assets/source.png'),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  right: 10,
                  child: Center(
                    child: Text('SoftX'),
                  ),
                ),
              ],
            ),
          );
        }),
      ),

    );
  }
}