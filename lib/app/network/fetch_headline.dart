

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:softx_news/app/modules/home/model/home_model.dart';

class FetchHeadLineData {
  Dio dio = Dio();
  static String apikey = '45714413d5a3484085a3d82fdc1abce5';
  String Url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apikey";
  Future<List<Articles>?> fetchData() async {
    try {
      Response response = await dio.get(Url);
      FetchData fetchData = FetchData.fromJson(response.data);
      return fetchData.articles;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}

