import 'package:get/get.dart';
import 'package:softx_news/app/modules/source/controllers/source_controller.dart';


class SourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourceController>(() => SourceController(),
    );
  }
}
