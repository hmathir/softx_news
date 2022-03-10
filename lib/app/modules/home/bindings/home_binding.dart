import 'package:get/get.dart';
import 'package:softx_news/app/modules/home/controllers/home_controller.dart';
import 'package:softx_news/app/modules/sports/controllers/sports_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(),
    );
    Get.lazyPut<SportsController>(() => SportsController(),
    );
  }
}
