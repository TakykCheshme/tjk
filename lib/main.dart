import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/cartP.dart';
import 'package:tjk/providers/favoritesP.dart';
import 'package:tjk/providers/homeP.dart';
import 'package:tjk/views/mainV.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
  ));
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox("tjk");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppP>(create: (context) => AppP()),
        ChangeNotifierProvider<CartP>(create: (context) => CartP()),
        ChangeNotifierProxyProvider<AppP, FavoritesP>(
          create: (context) => FavoritesP(),
          update: (context, app, favorites) => favorites..tjkBox = app.tjkBox,
        ),
        ChangeNotifierProxyProvider<AppP, HomeP>(
          create: (_) => HomeP(),
          update: (_, app, home) => home..ln = app.ln,
        ),
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
