import 'package:get/get.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';
import 'package:softx_news/app/modules/health/controllers/health_controller.dart';


class HealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthController>(
      () => HealthController(),
    );
    Get.lazyPut<CoreController>(() => CoreController(),
    );

  }
}
