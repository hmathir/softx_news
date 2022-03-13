import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/views/News_View.dart';
import '../controllers/sports_controller.dart';

class SportsView extends GetView<SportsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.sportsNewsList.isEmpty) {
          return Center(
            child: Text('No Post Found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.sportsNewsList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => NewsView(
                        title: controller.sportsNewsList[index].title.toString(),
                        details: controller.sportsNewsList[index].description
                            .toString(),
                        image: controller.sportsNewsList[index].urlToImage,
                        content:
                            controller.sportsNewsList[index].content.toString(),
                        shareURL: controller.sportsNewsList[index].urlToImage
                            .toString(),
                        source: controller.sportsNewsList[index].source.name
                            .toString(),
                        publishDT: controller.sportsNewsList[index].publishedAt
                            .toString(),
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
                            controller.sportsNewsList[index].urlToImage == null
                                ? Expanded(
                                    child: Image.asset(
                                        'assets/imagenotavailable.png'))
                                : Expanded(
                                    child: Image.network(
                                      controller
                                          .sportsNewsList[index].urlToImage,
                                      fit: BoxFit.cover,
                                      width: 300,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
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
                              child: Text(controller.sportsNewsList[index].title
                                  .toString()),
                            )
                          ],
                        ),
                      )),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
