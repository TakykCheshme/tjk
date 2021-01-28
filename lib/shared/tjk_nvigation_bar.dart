import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/providers/cartP.dart';
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
        child: Container(
          width: 30.0,
          child: Consumer<CartP>(
            builder: (_, cart, __) => Stack(
              children: [
                Icon(CupertinoIcons.cart, size: 28.0),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color:
                          cart.items.isEmpty ? Colors.transparent : Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => false;
}
