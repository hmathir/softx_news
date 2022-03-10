import 'package:get/get.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';
import 'package:softx_news/app/modules/home/controllers/home_controller.dart';
import 'package:softx_news/app/modules/source/controllers/source_controller.dart';
import 'package:softx_news/app/modules/sports/controllers/sports_controller.dart';
import 'package:softx_news/app/network/httpRequest.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoreController>(
      () => CoreController(), fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SourceController>(
      () => SourceController(),
    );
    Get.lazyPut<SportsController>(
      () => SportsController(),
    );
    Get.lazyPut<HttpRequest>(
          () => HttpRequest(),
    );
  }
}
