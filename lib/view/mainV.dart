import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tjk/view/accountV.dart';
import 'package:tjk/view/homeV.dart';
import 'package:tjk/view/searchV.dart';

class MainV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
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
        return CupertinoTabView(
          builder: (context) => AccountV(),
        );
      },
    );
  }
}
