import 'package:dio/dio.dart';

class HttpRequest {
  String baseurl = 'https://newsapi.org/v2/top-headlines';
  String apiKey = 'apiKey=45714413d5a3484085a3d82fdc1abce5';

  Future topHeadLine() async {
    var dio = Dio();
    final response = await dio.get('$baseurl?country=us&$apiKey');
      return response.data['articles'];
    }

  Future sourceList() async {
    var dio = Dio();
    final response = await dio.get('$baseurl/sources?$apiKey');
    return response.data['sources'];
  }

  Future sportsNews() async {
    var dio = Dio();
    final response = await dio.get('$baseurl?country=us&category=sports&$apiKey');
    return response.data['articles'];
  }

  Future techNews() async {
    var dio = Dio();
    final response = await dio.get('$baseurl?country=us&category=technology&$apiKey');
    return response.data['articles'];
  }


}