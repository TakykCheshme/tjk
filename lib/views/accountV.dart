import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/views/loginV.dart';

import '../const.dart';

class AccountV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppP>(
      builder: (context, app, child) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(LN["hasabym"][app.ln], style: titleTS),
          trailing: Icon(CupertinoIcons.cart, size: 28.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoButton.filled(
                child: Text(LN["girmek"][app.ln]),
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(builder: (_) => LoginV()),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(LN["yada"][app.ln]),
                ),
              ),
              CupertinoButton.filled(
                child: Text(LN["hasap_doretmek"][app.ln]),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
