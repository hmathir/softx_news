import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softx_news/app/core/constant/const.dart';
import 'package:softx_news/app/core/controllers/core_controller.dart';
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
            title: pageTitle,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ],
            bottom: TabBar(isScrollable: true,tabs: [
              Tab(
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Sports',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Tech',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Education',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Covid 19',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
          ),
          body: TabBarView(children: [
            HomeView(),
            SportsView(),
            TechView(),
            HomeView(),
            SourceView(),
          ]))
    );
  }
}
