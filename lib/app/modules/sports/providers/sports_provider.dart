import 'package:get/get.dart';

class SportsProvider extends GetConnect {
  @override
  void onInit() {
  }

  Future<dynamic> getSportsProvider() async {
    final response = await get(
        'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=45714413d5a3484085a3d82fdc1abce5');
    if (response.status.hasError) {
      return response.statusText;
    } else {
      return response.body['articles'];
    }
  }
}
