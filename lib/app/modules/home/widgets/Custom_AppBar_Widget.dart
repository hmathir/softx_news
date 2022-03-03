import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../source/views/source_view.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              //Have to setup Drawer!
            },
            child: Icon(Icons.menu),
          ),
          Text(
            'SoftX News',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SourceView());
            },
            child: Icon(Icons.search_rounded),
          ),
        ],
      ),
    );
  }
}