import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(child: Text("Home")),
      navigationBar: CupertinoNavigationBar(
        middle:
            Text("Türkmenbaşy Jins Toplumy", style: TextStyle(fontSize: 20.0)),
        // leading: Icon(CupertinoIcons.search),
        trailing: Icon(CupertinoIcons.cart),
      ),
    );
  }
}
