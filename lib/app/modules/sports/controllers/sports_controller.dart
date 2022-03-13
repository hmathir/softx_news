import 'package:get/get.dart';
import 'package:softx_news/app/modules/sports/providers/sports_provider.dart';

class SportsController extends GetxController {
  var sports = [].obs;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSports();
  }

Future getSports() async{
    loading(true);
    sports (await SportsProvider().getSportsProvider());
    loading(false);
}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
