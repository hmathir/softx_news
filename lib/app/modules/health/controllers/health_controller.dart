import 'package:get/get.dart';
import 'package:softx_news/app/network/fetch_health.dart';

class HealthController extends GetxController {
  var isLoading = false.obs;
  var healthNewsList = [].obs;

  @override
  void onInit() {
    super.onInit();
    healthNews();
  }

  void healthNews() async {
    isLoading(true);
    try {
      var healthNews = await FetchHealthData().fetchHealthData();
      if (healthNews != null) {
        healthNewsList.assignAll(healthNews);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
