import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tjk/views/accountV.dart';
import 'package:tjk/views/favoritesV.dart';
import 'package:tjk/views/homeV.dart';
import 'package:tjk/views/searchV.dart';
import 'package:tjk/views/settingsV.dart';

class MainV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
          BottomNavigationBarItem(icon: Icon(Icons.settings)),
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
