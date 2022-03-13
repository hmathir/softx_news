import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:softx_news/app/core/views/News_View.dart';
import 'package:softx_news/app/modules/home/controllers/home_controller.dart';

class AllNewsWidgets extends StatelessWidget {
  const AllNewsWidgets({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.headLineList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(() =>
                  NewsView(
                    title: controller.headLineList[index].title.toString(),
                    details:
                    controller.headLineList[index].description.toString(),
                    image: controller.headLineList[index].urlToImage,
                    content: controller.headLineList[index].content.toString(),
                    shareURL: controller.headLineList[index].urlToImage.toString(),
                    source: controller.headLineList[index].source.name.toString(),
                    publishDT: controller.headLineList[index].publishedAt.toString(),
                  ));
            },
            child: Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  if (controller.headLineList[index].urlToImage == null) Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                            'assets/imagenotavailable.png',
                            fit: BoxFit.fill,
                            height: 70,
                            width: 100,
                        ),
                          )) else Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              controller.headLineList[index].urlToImage.toString(),
                              fit: BoxFit.fill,
                              height: 70,
                              width: 100,
                              loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: Shimmer.fromColors(child: child, baseColor: Colors.black, highlightColor: Colors.black)
                                );
                              },
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.headLineList[index].title.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
