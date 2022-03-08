import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/source_controller.dart';

class SourceView extends GetView<SourceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.source.isEmpty) {
          return Center(
            child: Text('No Post Found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.source.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/BBC.png',
                        height: 70,
                        width: 70,

                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.source[index]['name']),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
      ),
    );
  }
}
