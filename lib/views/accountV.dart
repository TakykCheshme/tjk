import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/shared/account_details.dart';
import 'package:tjk/shared/tjk_nvigation_bar.dart';

class AccountV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppP>(
      builder: (context, app, child) => Scaffold(
        body: CupertinoPageScaffold(
          navigationBar: TJKNavigationBar(LN["hasabym"][app.ln]),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 120.0,
            ),
            child: AccountDetails(),
          ),
        ),
      ),
    );
  }
}
