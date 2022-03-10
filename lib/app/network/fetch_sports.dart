import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:softx_news/app/modules/sports/model/sports_model.dart';

class FetchSportsData {
  Dio dio = Dio();
  static String apiKey = '45714413d5a3484085a3d82fdc1abce5';
  String Url =
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$apiKey";
  Future<List<SportsArticles>?> fetchSportsData() async {
    try {
      Response response = await dio.get(Url);
      FetchSportsModelData fetchSportsModelData = FetchSportsModelData.fromJson(response.data);
      return fetchSportsModelData.articles;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}

