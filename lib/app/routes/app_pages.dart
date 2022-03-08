import 'package:get/get.dart';

import '../core/bindings/core_binding.dart';
import '../core/views/core_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/source/bindings/source_binding.dart';
import '../modules/source/views/source_view.dart';
import '../modules/sports/bindings/sports_binding.dart';
import '../modules/sports/views/sports_view.dart';

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
  ];
}
