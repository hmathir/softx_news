import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/views/News_View.dart';


class BreakingNewsSliderWidget extends StatelessWidget {
  const BreakingNewsSliderWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final  controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Card(
        // width: MediaQuery.of(context).size.width,
        // height: 180,\
        elevation: 20,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: CarouselSlider.builder(
          itemCount: controller.news.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
              InkWell(
                onTap: (){
                  Get.to(()=> NewsView(index: index, value: controller.news));
                },
                child: Stack(
                  fit: StackFit.expand,
            children: [
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:
                      controller.news[index]['urlToImage'] == null
                          ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xff7c94b6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                            image: AssetImage(
                              'assets/imagenotavailable.png'
                            ),
                          ),
                        ),
                      )
                          : Container(
                        decoration: BoxDecoration(
                          color: Color(0xff7c94b6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                            image: NetworkImage(
                              controller.news[index]['urlToImage'] ,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Center(child: Text(controller.news[index]['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),)),
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
    );
  }
}
