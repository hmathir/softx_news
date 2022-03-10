import 'package:get/get.dart';
import 'package:softx_news/app/modules/search/controllers/search_controller.dart';



class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
