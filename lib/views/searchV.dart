import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/searchP.dart';

import '../const.dart';

class SearchV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppP app = Provider.of<AppP>(context);

    return ChangeNotifierProvider(
      create: (context) => SearchP(),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(LN["gozleg"][app.ln], style: titleTS),
          trailing: Icon(CupertinoIcons.cart, size: 28.0),
        ),
        child: Center(child: Text("Search")),
      ),
    );
  }
}
