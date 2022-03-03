import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: Obx(() {
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
          return ListView.builder(
              itemCount: controller.news.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(controller.news[index]['title']));
              });
        }));
  }
}
