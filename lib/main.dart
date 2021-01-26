import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
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
        ChangeNotifierProvider<HomeP>(create: (context) => HomeP()),
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
