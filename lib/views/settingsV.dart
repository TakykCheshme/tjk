import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/appP.dart';

import '../const.dart';

class SettingsV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppP app = Provider.of<AppP>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(LN["sazlamalar"][app.ln], style: titleTS),
        trailing: Icon(CupertinoIcons.cart, size: 28.0),
      ),
      child: Scaffold(
        body: ListView(
          children: [
            ListTile(
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: Text(LN["dil_saylan"][app.ln] + ":", style: titleTS),
                  actions: [
                    CupertinoActionSheetAction(
                        onPressed: () {
                          app.ln = "tm";
                          Navigator.of(context).pop();
                        },
                        child: Text(LN["ln"]["tm"])),
                    CupertinoActionSheetAction(
                        onPressed: () {
                          app.ln = "ru";
                          Navigator.of(context).pop();
                        },
                        child: Text(LN["ln"]["ru"])),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(LN["yapmak"][app.ln]),
                  ),
                ),
              ),
              leading: Icon(Icons.language),
              title: Text(LN["programma_dili"][app.ln], style: titleTS),
              trailing: Text(LN["ln"][app.ln]),
            ),
          ],
        ),
      ),
    );
  }
}
