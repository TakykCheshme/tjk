import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/language.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/detailP.dart';
import 'package:tjk/providers/homeP.dart';

class DetailV extends StatelessWidget {
  DetailV(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    HomeP home = Provider.of<HomeP>(context);

    return ChangeNotifierProxyProvider<AppP, DetailP>(
      create: (context) => DetailP(
        id: product.id,
        categoryId: home.categories[home.selectedCategory].id,
      ),
      update: (context, app, detail) => detail..ln = app.ln,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            product.name,
            style: titleTS,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(CupertinoIcons.cart, size: 28.0),
        ),
        child: Consumer<DetailP>(
          builder: (context, detail, child) => detail.loading
              ? CupertinoActivityIndicator()
              : ListView(
                  children: [
                    _buildCarouselSlider(detail),
                    Divider(thickness: 1.0),
                    _buildTitlePriceLike(),
                    Divider(thickness: 1.0),
                    _buildSizes(detail),
                    Divider(thickness: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(LN["menzesh_harytlar"][detail.ln],
                          style: titleTS),
                    ),
                    _buildRelatedSlider(detail),
                    SizedBox(height: 20.0),
                  ],
                ),
        ),
      ),
    );
  }

  Container _buildRelatedSlider(DetailP detail) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: detail.related.length,
        itemBuilder: (context, index) {
          Product rel = detail.related[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => DetailV(rel),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              width: 160.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 160 / 200,
                      child: CachedNetworkImage(
                        imageUrl: rel.cover,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => CupertinoActivityIndicator(),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(.8),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: Text(
                        rel.price.toStringAsFixed(2) + " m.",
                        style: titleTS.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _buildSizes(DetailP detail) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(LN["olchegler"][detail.ln], style: titleTS),
          SizedBox(height: 10.0),
          CupertinoSlidingSegmentedControl(
            groupValue: detail.selectedAttribute,
            children: {
              for (int i = 0; i < detail.attributes.length; i++)
                i: Text(
                  detail.attributes[i],
                  style: TextStyle(
                    color: i == detail.selectedAttribute
                        ? Colors.white
                        : Colors.black,
                    fontSize: 20.0,
                  ),
                )
            },
            onValueChanged: (attr) => detail.selectedAttribute = attr,
            thumbColor: primaryColor,
          ),
        ],
      ),
    );
  }

  Padding _buildTitlePriceLike() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: titleTS),
                Text(product.price.toStringAsFixed(2) + " m.",
                    style: title28TS.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor),
            ),
            child: Icon(Icons.favorite_border, size: 28.0),
          ),
        ],
      ),
    );
  }

  CarouselSlider _buildCarouselSlider(DetailP detail) {
    return CarouselSlider.builder(
      itemCount: detail.images.length,
      itemBuilder: (context, index) => CachedNetworkImage(
        imageUrl: detail.images[index],
        placeholder: (_, __) => CupertinoActivityIndicator(),
      ),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.0,
        enlargeCenterPage: true,
        viewportFraction: .8,
      ),
    );
  }
}
