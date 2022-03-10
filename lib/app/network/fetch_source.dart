
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:softx_news/app/modules/source/model/source_model.dart';

class FetchSourceData {
  Dio dio = Dio();
  static String apiKey = '45714413d5a3484085a3d82fdc1abce5';
  String Url =
      "https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey";
  Future<List<Sources>?> fetchSourceData() async {
    try {
      Response response = await dio.get(Url);
      FetchSourceDataModel fetchSourceDataModel = FetchSourceDataModel.fromJson(response.data);
      return fetchSourceDataModel.sources;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}