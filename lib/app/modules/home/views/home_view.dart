import 'package:flutter/material.dart';
import '../widgets/Heading_Text_Widgets.dart';
import '../widgets/Hot_News_Widgets.dart';
import '../widgets/News_On_Fire_Slider.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/Top_Ten_Channel_Slider.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
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
                  NewsOnFireWidgets(controller: controller),
                  HeadingTexts(
              text: 'Top 10 Channels',
            ),
                  TopTenChannelWidgets(controller: controller),
                  HeadingTexts(
              text: 'Hot News',
            ),
                  HotNewsWidgets(controller: controller)],
            ),
          );
        },
      ),
    );
  }
}


