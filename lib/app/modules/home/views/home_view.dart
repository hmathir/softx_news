import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:softx_news/app/modules/home/widgets/All_News_Widgets.dart';
import 'package:softx_news/app/modules/home/widgets/Breaking_News_Slider_Widgets.dart';
import 'package:softx_news/app/modules/home/widgets/Secondary_Slider_Widgets.dart';
import 'package:softx_news/app/modules/home/widgets/Third_Slider.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';

class HomeView extends GetView<CoreController> {

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
                        text: 'Latest News: ' + controller.sports[0]['title'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        scrollAxis: Axis.horizontal,
                        blankSpace: 100.0,
                        velocity: 100.0,
                        pauseAfterRound: Duration(seconds: 1),
                        startPadding: 10.0,
                        accelerationCurve: Curves.linear,
                        decelerationCurve: Curves.easeOut,
                      ),
                  ),
                  BreakingNewsSliderWidget(controller: controller),
                  SecondarySlider(controller: controller),
                  ThirdSliderWidget(controller: controller),
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

