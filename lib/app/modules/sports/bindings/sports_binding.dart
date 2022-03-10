import 'package:get/get.dart';
import 'package:softx_news/app/modules/sports/controllers/sports_controller.dart';


class SportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SportsController>(
      () => SportsController(),
    );

  }
}
