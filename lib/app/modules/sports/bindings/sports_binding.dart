import 'package:get/get.dart';

import '../controllers/sports_controller.dart';

class SportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SportsController>(
      () => SportsController(),
    );
  }
}
