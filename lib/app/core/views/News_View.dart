import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/constant/const.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';


// ignore: must_be_immutable
class NewsView extends GetView<CoreController> {
   NewsView({ required this.index,required this.value,});
   var index;
   var value;

  @override
  Widget build(BuildContext context) {
    Future<void> share() async {
      await FlutterShare.share(
          title: value[index]['title'],
          linkUrl: value[index]['url']);
          }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: pageTitle,
        actions: [
          IconButton(onPressed: share, icon: Icon(Icons.share))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(() {
            if (controller.loading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value.isEmpty) {
              return Center(
                child: Text('No Post Found'),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                value[index]['urlToImage'] == null
                    ? Image.asset('assets/imagenotavailable.png')
                    : Image.network(
                        value[index]['urlToImage'],
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                Text(
                  value[index]['title'] == null
                      ? ''
                      :value[index]['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10,),
                Text(value[index]['description'] == null
                    ? ''
                    :'Description:: \n'  + value[index]['description']),
                    SizedBox(height: 10,),
                Text(value[index]['content'] == null
                    ? ''
                    : 'Content: \n'  + value[index]['content']),
                    SizedBox(height: 20,),
                    Text('Source: ' + value[index]['source']['name'] == '' ? '' : 'Source: ' + value[index]['source']['name']),
                    Text('Published Date & Time: ' + value[index]['publishedAt'] == '' ? '' : 'Published Date & Time: ' + value[index]['publishedAt']),
              ]),

            );
          }),
        ),
      ),
    );
  }
}
