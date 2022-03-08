import 'package:get/get.dart';

class SourceProvider extends GetConnect {
  @override
  void onInit() {
  }

  Future<dynamic> getSourcesProvider() async {
    final response = await get(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=45714413d5a3484085a3d82fdc1abce5');
    if (response.status.hasError) {
      return response.statusText;
    } else {
      return response.body['sources'];
    }
  }
}
