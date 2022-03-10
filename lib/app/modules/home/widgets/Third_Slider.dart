import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';
import 'package:softx_news/app/core/views/News_View.dart';

class ThirdSliderWidget extends StatelessWidget {
  const ThirdSliderWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CoreController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: 20,
          right: 6,
          bottom: 20,
        ),
        itemCount: controller.sports.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // onTap: (){
            //   Get.to(() => NewsView(index: index, value: controller.news));
            // },
            onTap: (){
              Get.to(() => NewsView(index: index,  value: controller.sports,));
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
                      child: controller.sports[index]['urlToImage'] == null
                          ? Container()
                          : Container(
                        decoration: BoxDecoration(
                          color: Color(0xff7c94b6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                            image: NetworkImage(
                              controller.sports[index]['urlToImage'],
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
                      controller.sports[index]['title'],
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
    );
  }
}