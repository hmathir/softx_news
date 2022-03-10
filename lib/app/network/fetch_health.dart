
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:softx_news/app/modules/health/model/health_model.dart';

class FetchHealthData{
  Dio dio = Dio();

  static String apiKey = '45714413d5a3484085a3d82fdc1abce5';
  String url ='https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=$apiKey';

  Future <List<HealthArticles>?> fetchHealthData() async{
    try {
      Response response = await dio.get(url);
      FetchHealthDataModel fetchHealthDataModel = FetchHealthDataModel.fromJson(response.data);
      return fetchHealthDataModel.articles;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }

}