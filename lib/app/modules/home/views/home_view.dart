import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../widgets/Breaking_News_Slider_Widgets.dart';
import '../widgets/All_News_Widgets.dart';
import '../widgets/Top_News_Slider_Widgets.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/Secondary_Slider_Widgets.dart';

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
                  Container(
                        height: 20,
                        child: Marquee(
                          text: controller.news[0]['title'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          scrollAxis: Axis.horizontal,
                          blankSpace: 20.0,
                          velocity: 100.0,
                          pauseAfterRound: Duration(seconds: 1),
                          startPadding: 10.0,
                          accelerationCurve: Curves.linear,
                          decelerationCurve: Curves.easeOut,
                        ),
                  ),
                  TopNewsSlider(
                    controller: controller,
                  ),
                  SecondarySlider(controller: controller),
                  BreakingNewsSliderWidget(controller: controller),
                  AllNewsWidgets(controller: controller),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
