import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/providers/homeP.dart';

class HomeV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeP home = Provider.of<HomeP>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Türkmenbaşy Jins Toplumy", style: titleTS),
        trailing: Icon(CupertinoIcons.cart, size: 28.0),
      ),
      child: ListView(
        children: [],
      ),
    );
  }
}
