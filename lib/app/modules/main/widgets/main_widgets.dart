import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class ButtomNavigationBarWidgets extends GetView<MainController> {
  const ButtomNavigationBarWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.black,
      onTap: controller.ChangeTabController,
      currentIndex: controller.tabIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.source),
          label: 'Source',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
    );
  }
}