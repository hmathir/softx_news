import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/views/News_View.dart';
import 'package:softx_news/app/modules/health/controllers/health_controller.dart';


class HealthView extends GetView<HealthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.healthNewsList.isEmpty) {
          return Center(
            child: Text('No Post Found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.healthNewsList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() =>
                      NewsView(
                        title: controller.healthNewsList[index].title.toString(),
                        details:
                        controller.healthNewsList[index].description.toString(),
                        image: controller.healthNewsList[index].urlToImage.toString(),
                        content: controller.healthNewsList[index].content.toString(),
                        shareURL: controller.healthNewsList[index].urlToImage.toString(),
                        source: controller.healthNewsList[index].source.name.toString(),
                        publishDT: controller.healthNewsList[index].publishedAt.toString(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          controller.healthNewsList[index].urlToImage == null
                              ? Expanded(
                                  child:
                                      Image.asset('assets/imagenotavailable.png'))
                              : Expanded(
                                  child: Image.network(
                                    controller.healthNewsList[index].urlToImage,
                                    fit: BoxFit.cover,
                                    width: 300,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value:
                                              loadingProgress.expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(controller.healthNewsList[index].title.toString()),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
