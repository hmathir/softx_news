import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:softx_news/app/core/views/News_View.dart';
import 'package:softx_news/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/modules/home/widgets/All_News_Widgets.dart';
import 'package:softx_news/app/modules/source/controllers/source_controller.dart';
import 'package:softx_news/app/modules/sports/controllers/sports_controller.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class HomeView extends GetView<HomeController> {

  SportsController sportsController = Get.find<SportsController>();
  SourceController sourceController = Get.find<SourceController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value && sportsController.isLoading.value && sourceController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.headLineList.isEmpty) {
          return Center(
            child: Text('No Post Found'),
          );
        };
          return SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 20,
                  child: Marquee(
                    text: 'Latest News: ' +
                        controller.headLineList[0].title.toString(),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Column(children: [
                      Card(
                        // width: MediaQuery.of(context).size.width,
                        // height: 180,\
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CarouselSlider.builder(
                          itemCount: controller.headLineList.length,
                          itemBuilder: (BuildContext context, int index,
                                  int pageViewIndex) =>
                              InkWell(
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
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Positioned(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: controller.headLineList[index]
                                                .urlToImage ==
                                            null
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black12,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.1),
                                                    BlendMode.dstATop),
                                                image: AssetImage(
                                                    'assets/imagenotavailable.png'),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            child: Image.network(
                                              controller.headLineList[index]
                                                  .urlToImage
                                                  .toString(),
                                              fit: BoxFit.cover,
                                              width: 300,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
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
                                  ),
                                ),
                                Positioned(
                                  top: 100,
                                  left: 20,
                                  right: 20,
                                  child: Center(
                                      child: Text(
                                    controller.headLineList[index].title
                                        .toString(),
                                    style: TextStyle(
                                        backgroundColor: Colors.white,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          options: CarouselOptions(
                            height: 180,
                            viewportFraction: 1,
                            autoPlay: true,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 6,
                      bottom: 20,
                    ),
                    itemCount: sourceController.sourceList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          UrlLauncher.launch(sourceController.sourceList[index].url.toString());
                        },
                        child: Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Center(child: Text(sourceController.sourceList[index].name)),),],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 6,
                    bottom: 20,
                  ),
                  itemCount: sportsController.sportsNewsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            NewsView(
                              title: sportsController.sportsNewsList[index].title.toString(),
                              details:
                              sportsController.sportsNewsList[index].description.toString(),
                              image: sportsController.sportsNewsList[index].urlToImage,
                              content: sportsController.sportsNewsList[index].content.toString(),
                              shareURL: sportsController.sportsNewsList[index].urlToImage.toString(),
                              source: sportsController.sportsNewsList[index].source.name.toString(),
                              publishDT: sportsController.sportsNewsList[index].publishedAt.toString(),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 14),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Positioned(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: sportsController.sportsNewsList[index].urlToImage == null
                                    ? Container()
                                    : Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff7c94b6),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                                      image: NetworkImage(
                                        sportsController.sportsNewsList[index].urlToImage,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 10,
                              right: 0,
                              bottom: 0,
                              child: Text(
                                sportsController.sportsNewsList[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
                AllNewsWidgets(controller: controller),
              ],
            ),
          );
        },
      ),
    );
  }
}

// title: snapshot.data![index].title.toString(),
// details: snapshot.data![index].description.toString(),
// image: snapshot.data![index].urlToImage.toString(),
