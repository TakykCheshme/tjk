import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tjk/views/accountV.dart';
import 'package:tjk/views/favoritesV.dart';
import 'package:tjk/views/homeV.dart';
import 'package:tjk/views/searchV.dart';
import 'package:tjk/views/settingsV.dart';

class MainV extends StatefulWidget {
  @override
  _MainVState createState() => _MainVState();
}

class _MainVState extends State<MainV> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0)
          return CupertinoTabView(
            builder: (context) => HomeV(),
          );
        else if (index == 1)
          return CupertinoTabView(
            builder: (context) => SearchV(),
          );
        else if (index == 2)
          return CupertinoTabView(
            builder: (context) => FavoritesV(),
          );
        else if (index == 3)
          return CupertinoTabView(
            builder: (context) => AccountV(),
          );
        return CupertinoTabView(
          builder: (context) => SettingsV(),
        );
      },
    );
  }
}
