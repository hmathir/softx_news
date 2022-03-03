import 'package:get/get.dart';
import 'package:softx_news/app/modules/home/providers/news_provider.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/main_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<NewsProvider>(
          () => NewsProvider(),
    );
  }
}
