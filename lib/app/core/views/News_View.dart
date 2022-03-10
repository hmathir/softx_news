import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';



class NewsView extends GetView<CoreController> {
  final String? details;
  final String? title;
  final String? image;
  final String? content;
  final String? shareURL;
  final String? source;
  final String? publishDT;
  const NewsView({
    Key? key,
    this.details,
    this.title,
    this.image,
    this.content,
    this.shareURL,
    this.source,
    this.publishDT,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> share() async {
      await FlutterShare.share(
          title: title.toString(),
          linkUrl: shareURL.toString());
          }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(appLocalization.appTitle, style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: share, icon: Icon(Icons.share))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
             Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                image == null
                    ? Image.asset('assets/imagenotavailable.png', fit: BoxFit.cover,)
                    : Image.network(
                        image.toString(),
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
                  title == null
                      ? ''
                      :title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10,),
                Text(details == null
                    ? ''
                    :details.toString()),
                    SizedBox(height: 10,),
                Text(content == null
                    ? ''
                    : content.toString()),
                    SizedBox(height: 20,),
                    Text(source == '' ? '' :'Source: ' + source.toString(),style: TextStyle(color: Colors.red),),
                    Text(publishDT == '' ? '' : 'Published Date & Time: ' + publishDT.toString()),
              ]),

            )
        ),
      ),
    );
  }
}
