import 'package:flutter/material.dart';

class TabbarWidgets extends StatelessWidget {
  const TabbarWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 20, right: 20, top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Tab(
            text: "Home",
          ),
          Tab(
            text: "Sports",
          ),
          Tab(text: "Tech"),
          Tab(
            text: "Education",
          ),
          Tab(text: "Covid 19"),
        ],
      ),
    );
  }
}