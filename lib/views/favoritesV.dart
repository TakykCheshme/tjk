import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/language.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/favoritesP.dart';
import 'package:tjk/shared/product_list_tile.dart';
import 'package:tjk/shared/tjk_nvigation_bar.dart';

class FavoritesV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppP, FavoritesP>(
      builder: (context, app, favorites, child) => CupertinoPageScaffold(
        navigationBar: TJKNavigationBar(LN["halanlarym"][app.ln]),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.separated(
              itemCount: favorites.all.length,
              itemBuilder: (context, index) {
                Product product = favorites.all[index];
                return ProductListTile(product);
              },
              separatorBuilder: (_, __) => SizedBox(height: 10.0),
            ),
          ),
        ),
      ),
    );
  }
}
