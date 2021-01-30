import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/appP.dart';

import '../const.dart';

class ErrorMessage extends StatelessWidget {
  ErrorMessage(this.onTap);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<AppP>(
          builder: (context, app, _) => Text(
            LN["internet_birikmanizi_barlan"][app.ln],
            textAlign: TextAlign.center,
            style: titleTS,
          ),
        ),
        SizedBox(height: 30.0),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.refresh,
            size: 80.0,
          ),
        )
      ],
    );
  }
}
