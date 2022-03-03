import 'package:get/get.dart';

class NewsProvider extends GetConnect {
  @override
  void onInit() {
  }

  Future getNews() async{
    var response = await get('https://jsonplaceholder.typicode.com/posts');
    return response.body;

  }
}
