import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/shared/tjk_nvigation_bar.dart';

import '../const.dart';

class SettingsV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppP app = Provider.of<AppP>(context);

    return CupertinoPageScaffold(
      navigationBar: TJKNavigationBar(LN["sazlamalar"][app.ln]),
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
            Divider(thickness: 1.0),
            ListTile(
              onTap: () async {
                final InAppReview inAppReview = InAppReview.instance;
                try {
                  if (await inAppReview.isAvailable())
                    inAppReview.requestReview();
                  else
                    inAppReview.openStoreListing(appStoreId: "1551455624");
                } catch (e) {
                  print("errr");
                }
              },
              leading: Icon(CupertinoIcons.star),
              title: Text(LN["baha_bermek"][app.ln], style: titleTS),
            ),
            Divider(thickness: 1.0),
            ListTile(
              onTap: () => Share.share(LN["share_text"][app.ln]),
              leading: Icon(CupertinoIcons.share),
              title: Text(LN["paylash"][app.ln], style: titleTS),
            ),
            Divider(thickness: 1.0),
          ],
        ),
      ),
    );
  }
}
