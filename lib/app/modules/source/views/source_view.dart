import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/source_controller.dart';

class SourceView extends GetView<SourceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SourceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SourceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
