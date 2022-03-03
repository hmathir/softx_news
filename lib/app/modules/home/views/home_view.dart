import 'package:flutter/material.dart';
import '../widgets/Breaking_News_Slider_Widgets.dart';
import '../widgets/Custom_AppBar_Widget.dart';
import '../widgets/All_News_Widgets.dart';
import '../widgets/Top_News_Slider_Widgets.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/Secondary_Slider_Widgets.dart';
import '../widgets/Tabbar_Widgets.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.loading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.news.isEmpty) {
              return Center(
                child: Text('No Post Found'),
              );
            }
            return Container(
              child: ListView(
                children: [
                  CustomAppBarWidget(),
                  TabbarWidgets(),
                  TopNewsSlider(controller: controller),
                  SecondarySlider(controller: controller),
                  BreakingNewsSliderWidget(controller: controller),
                  AllNewsWidgets(controller: controller)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

