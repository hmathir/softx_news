import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class NewsOnFireWidgets extends StatelessWidget {
  const NewsOnFireWidgets({
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
        padding: EdgeInsets.only(left: 16, right: 6),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            width: 344,
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
        },
      ),
    );
  }
}
