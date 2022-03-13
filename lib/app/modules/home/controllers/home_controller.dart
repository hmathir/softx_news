import 'package:get/get.dart';
import 'package:softx_news/app/network/fetch_headline.dart';
class HomeController extends GetxController {

  var isLoading = false.obs;
  var headLineList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHeadline();
  }

  void fetchHeadline() async{
    isLoading(true);
    try{
      var headlines = await FetchHeadLineData().fetchData();
      if(headlines != null){
        headLineList.assignAll(headlines);
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
