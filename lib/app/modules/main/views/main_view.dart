import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:softx_news/app/modules/home/views/home_view.dart';
import 'package:softx_news/app/modules/main/widgets/main_widgets.dart';
import 'package:softx_news/app/modules/search/views/search_view.dart';
import 'package:softx_news/app/modules/source/views/source_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: ButtomNavigationBarWidgets(),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              SourceView(),
              SearchView(),
            ],
          ),
        ),
      );
    });
  }
}

