import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/detailP.dart';
import 'package:tjk/providers/homeP.dart';

class DetailV extends StatelessWidget {
  DetailV(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    HomeP home = Provider.of<HomeP>(context);

    return ChangeNotifierProvider(
      create: (context) => DetailP(
        id: product.id,
        categoryId: home.categories[home.selectedCategory].id,
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(product.name, style: titleTS),
          trailing: Icon(CupertinoIcons.cart, size: 28.0),
        ),
        child: Center(
          child: Consumer<DetailP>(
            builder: (context, detail, child) => Text("detail.s"),
          ),
        ),
      ),
    );
  }
}
