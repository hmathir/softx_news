import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';
import 'package:softx_news/app/modules/health/views/health_view.dart';
import 'package:softx_news/app/modules/home/views/home_view.dart';
import 'package:softx_news/app/modules/source/views/source_view.dart';
import 'package:softx_news/app/modules/sports/views/sports_view.dart';
import 'package:softx_news/app/modules/tech/views/tech_view.dart';

class CoreView extends GetView<CoreController> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
        length: 5,
        child: Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              child: ListView(
                children: [
                  Container(
                    color: Colors.red,
                  )
                ],
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  )),
              title: Text(
                appLocalization.appTitle,
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ],
              bottom: TabBar(isScrollable: true, tabs: [
                Tab(
                  child: Text(
                    appLocalization.home,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    appLocalization.sports,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    appLocalization.tech,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    appLocalization.health,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    appLocalization.source,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ),
            body: TabBarView(children: [
              HomeView(),
              SportsView(),
              TechView(),
              HealthView(),
              SourceView(),
            ])));
  }
}
