import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class BreakingNewsSliderWidget extends StatelessWidget {
  const BreakingNewsSliderWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 20, left: 20, right: 20),
      child: Card(
        // width: MediaQuery.of(context).size.width,
        // height: 180,
        color: Colors.amber,
        elevation: 20,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: CarouselSlider.builder(
          itemCount: controller.news.length,
          itemBuilder: (BuildContext context, int index,
              int pageViewIndex) =>
              Center(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(controller.news[index]['title']),
              )),
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            autoPlay: true,
          ),
        ),

      ),
    );
  }
}