import 'package:get/get.dart';
import 'package:softx_news/app/modules/source/providers/source_provider.dart';

class SourceController extends GetxController {
  SourceProvider sourceProvider = Get.find<SourceProvider>();

  var loading = false.obs;
  var source = [].obs; // Getting Sources Via NewsAPI

  @override
  void onInit() {
    super.onInit();
    getSources();
  }

  Future getSources() async{
    loading(true);
    source (await sourceProvider.getSourcesProvider());
    loading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
