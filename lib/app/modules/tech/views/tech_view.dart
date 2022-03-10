import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';
import 'package:softx_news/app/core/views/News_View.dart';



class TechView extends GetView<CoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.tech.isEmpty) {
          return Center(
            child: Text('No Post Found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.tech.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Get.to(()=> NewsView(index: index, value: controller.tech,));
                },
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
                        controller.tech[index]['urlToImage'] == null
                            ? Expanded(
                            child:
                            Image.asset('assets/imagenotavailable.png'))
                            : Expanded(
                          child: Image.network(
                            controller.tech[index]['urlToImage'],
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
                        Text(controller.tech[index]['title'].toString())
                      ],
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
