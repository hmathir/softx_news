import 'package:get/get.dart';
import 'package:softx_news/app/modules/home/providers/news_provider.dart';

class HomeController extends GetxController {
  NewsProvider newsProvider = Get.find<NewsProvider>();

  var news = [].obs;
  var loading = false.obs;


  final count = 0.obs;
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
  void increment() => count.value++;
}
