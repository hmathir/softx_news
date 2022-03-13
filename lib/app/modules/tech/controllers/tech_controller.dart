import 'package:get/get.dart';
import 'package:softx_news/app/network/fetch_tech.dart';

class TechController extends GetxController {

  var isLoading = false.obs;
  var techNewsList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTechNews();
  }

  void fetchTechNews() async{
    isLoading(true);
    try{
      var techNews = await FetchTechData().fetchTechData();
      if(techNews != null){
        techNewsList.assignAll(techNews);
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
