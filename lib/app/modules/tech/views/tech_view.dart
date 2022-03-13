import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/views/News_View.dart';
import 'package:softx_news/app/modules/tech/controllers/tech_controller.dart';


class TechView extends GetView<TechController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.techNewsList.isEmpty) {
          return Center(
            child: Text('No Post Found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.techNewsList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() =>
                      NewsView(
                        title: controller.techNewsList[index].title.toString(),
                        details:
                        controller.techNewsList[index].description.toString(),
                        image: controller.techNewsList[index].urlToImage,
                        content: controller.techNewsList[index].content.toString(),
                        shareURL: controller.techNewsList[index].urlToImage.toString(),
                        source: controller.techNewsList[index].source.name.toString(),
                        publishDT: controller.techNewsList[index].publishedAt.toString(),
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
                          controller.techNewsList[index].urlToImage == null
                              ? Expanded(
                              child:
                              Image.asset('assets/imagenotavailable.png'))
                              : Expanded(
                            child: Image.network(
                              controller.techNewsList[index].urlToImage ,
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
                            child: Text(controller.techNewsList[index].title.toString()),
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
