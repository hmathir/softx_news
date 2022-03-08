import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
  }

  Future<dynamic> getNewsProvider() async {
    final response = await get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=45714413d5a3484085a3d82fdc1abce5');
    if (response.status.hasError) {
      return response.statusText;
    } else {
      return response.body['articles'];
    }
  }
}