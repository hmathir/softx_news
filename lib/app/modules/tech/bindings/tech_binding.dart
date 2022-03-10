import 'package:get/get.dart';
import 'package:softx_news/app/modules/tech/controllers/tech_controller.dart';



class TechBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TechController>(
      () => TechController(),
    );
  }
}
