import 'package:get/get.dart';
import 'package:softx_news/app/network/fetch_source.dart';

class SourceController extends GetxController {

  var isLoading = false.obs;
  var sourceList = [].obs;

  @override
  void onInit() {
    FetchSource();
    super.onInit();
  }

  void FetchSource() async{
    isLoading(true);
    try{
      var sources = await FetchSourceData().fetchSourceData();
      if(sources != null){
        sourceList.assignAll(sources);
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
