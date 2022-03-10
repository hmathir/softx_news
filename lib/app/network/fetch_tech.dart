//

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:softx_news/app/modules/tech/model/tech_model.dart';

class FetchTechData{
  Dio dio = Dio();
  static String apikey = '45714413d5a3484085a3d82fdc1abce5';
  String url = 'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=$apikey';
  Future <List<TechArticles>?> fetchTechData () async {
    try{
      Response response = await dio.get(url);
      FetchTechDataModel fetchTechDataModel = FetchTechDataModel.fromJson(response.data);
      return fetchTechDataModel.articles;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;

  }


}