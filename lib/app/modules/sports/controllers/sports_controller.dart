import 'package:get/get.dart';
import 'package:softx_news/app/network/fetch_sports.dart';

class SportsController extends GetxController {

  var isLoading = false.obs;
  var sportsNewsList = [].obs;


  @override
  void onInit() {
    fetchSportsNews();
    super.onInit();
  }

  void fetchSportsNews() async{
    try {
      isLoading(true);
      var sportsNews = await FetchSportsData().fetchSportsData();
      if(sportsNews != null) {
        sportsNewsList.assignAll(sportsNews);
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
