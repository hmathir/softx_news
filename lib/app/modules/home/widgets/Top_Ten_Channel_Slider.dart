import 'package:flutter/material.dart';
import 'package:softx_news/app/modules/home/controllers/home_controller.dart';

class TopTenChannelWidgets extends StatelessWidget {
  const TopTenChannelWidgets({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 95,
            margin: EdgeInsets.only(right: 10),
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}