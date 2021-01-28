import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tjk/models/product.dart';
import 'package:tjk/views/detailV.dart';

import '../const.dart';

class ProductListTile extends StatelessWidget {
  ProductListTile(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => DetailV(product),
        ),
      ),
      title: Text(product.name, style: titleTS),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: product.cover,
          ),
        ),
      ),
      trailing: Text(
        product.price.toStringAsFixed(2) + " m.",
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
