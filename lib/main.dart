import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/homeP.dart';
import 'package:tjk/views/mainV.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppP>(create: (context) => AppP()),
        ChangeNotifierProxyProvider<AppP, HomeP>(
          create: (_) => HomeP(),
          update: (_, app, home) => home..ln = app.ln,
        )
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
        ),
        home: MainV(),
      ),
    );
  }
}
