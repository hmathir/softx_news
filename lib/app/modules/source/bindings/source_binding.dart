import 'package:get/get.dart';
import 'package:softx_news/app/modules/source/providers/source_provider.dart';
import '../controllers/source_controller.dart';

class SourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourceController>(() => SourceController(),
    );
    Get.lazyPut<SourceProvider>(() => SourceProvider(),
    );
  }
}
