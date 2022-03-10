import 'package:get/get.dart';
import 'package:softx_news/app/network/httpRequest.dart';


class CoreController extends GetxController {
  HttpRequest httpRequest = Get.find<HttpRequest>();

  var index;
  var loading = false.obs;
  var news = [].obs;
  var sports = [].obs;
  var source = [].obs;
  var tech = [].obs;

  @override
  void onInit() {
    super.onInit();
    getAllApi();
  }

  Future<dynamic> getAllApi() async{
    loading(true);
    source (await httpRequest.sourceList());
    news (await httpRequest.topHeadLine());
    sports (await httpRequest.sportsNews());
    tech (await httpRequest.techNews());
    loading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
