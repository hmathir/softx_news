import 'package:get/get.dart';
import 'package:softx_news/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  HomeProvider newsProvider = Get.find<HomeProvider>();


  var loading = false.obs;
  var news = [].obs; // Getting Top Headline News Via NewsAPI

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  Future getNews() async{
    loading(true);
    news (await newsProvider.getNewsProvider());
    loading(false);
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
