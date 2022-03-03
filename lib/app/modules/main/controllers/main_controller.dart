import 'package:get/get.dart';

class MainController extends GetxController {
  var tabIndex = 0;

  void ChangeTabController(int index){
    tabIndex = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
