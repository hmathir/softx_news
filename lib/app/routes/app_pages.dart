import 'package:get/get.dart';
import 'package:softx_news/app/core/bindings/core_binding.dart';
import 'package:softx_news/app/core/views/core_view.dart';
import 'package:softx_news/app/modules/home/bindings/home_binding.dart';
import 'package:softx_news/app/modules/home/views/home_view.dart';
import 'package:softx_news/app/modules/search/bindings/search_binding.dart';
import 'package:softx_news/app/modules/search/views/search_view.dart';
import 'package:softx_news/app/modules/source/bindings/source_binding.dart';
import 'package:softx_news/app/modules/source/views/source_view.dart';
import 'package:softx_news/app/modules/sports/bindings/sports_binding.dart';
import 'package:softx_news/app/modules/sports/views/sports_view.dart';
import 'package:softx_news/app/modules/tech/bindings/tech_binding.dart';
import 'package:softx_news/app/modules/tech/views/tech_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CORE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SOURCE,
      page: () => SourceView(),
      binding: SourceBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CORE,
      page: () => CoreView(),
      binding: CoreBinding(),
    ),
    GetPage(
      name: _Paths.SPORTS,
      page: () => SportsView(),
      binding: SportsBinding(),
    ),
    GetPage(
      name: _Paths.TECH,
      page: () => TechView(),
      binding: TechBinding(),
    ),
  ];
}
