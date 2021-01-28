import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tjk/views/cartV.dart';

import '../const.dart';

class TJKNavigationBar extends StatelessWidget
    with ObstructingPreferredSizeWidget {
  TJKNavigationBar(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(
        title,
        style: titleTS,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: GestureDetector(
          onTap: () => Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(builder: (context) => CartV()),
              ),
          child: Icon(CupertinoIcons.cart, size: 28.0)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => false;
}
