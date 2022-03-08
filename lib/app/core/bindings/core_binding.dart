import 'package:get/get.dart';
import 'package:softx_news/app/modules/home/controllers/home_controller.dart';
import 'package:softx_news/app/modules/home/providers/home_provider.dart';
import 'package:softx_news/app/modules/source/controllers/source_controller.dart';
import 'package:softx_news/app/modules/source/providers/source_provider.dart';
import 'package:softx_news/app/modules/sports/controllers/sports_controller.dart';
import 'package:softx_news/app/modules/sports/providers/sports_provider.dart';

import '../controllers/core_controller.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoreController>(
      () => CoreController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<HomeProvider>(
          () => HomeProvider(),
    );
    Get.lazyPut<SourceController>(
          () => SourceController(),
    );
    Get.lazyPut<SourceProvider>(
          () => SourceProvider(),
    );
    Get.lazyPut<SportsController>(
          () => SportsController(),
    );
    Get.lazyPut<SportsProvider>(
          () => SportsProvider(),
    );

  }
}
