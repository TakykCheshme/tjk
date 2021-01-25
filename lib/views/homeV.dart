import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/providers/homeP.dart';

class HomeV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeP home = Provider.of<HomeP>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Türkmenbaşy Jins Toplumy", style: titleTS),
        trailing: Icon(CupertinoIcons.cart, size: 28.0),
      ),
      child: Consumer<HomeP>(
        builder: (context, home, child) => home.loading
            ? CupertinoActivityIndicator()
            : ListView(
                children: [
                  _buildCarouselSlider(home),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CupertinoSlidingSegmentedControl(
                      groupValue: home.selectedCategory,
                      children: {
                        for (int i = 0; i < home.categories.length; i++)
                          i: Text(home.categories[i].name),
                      },
                      onValueChanged: (category) =>
                          home.selectedCategory = category,
                    ),
                  )
                ],
              ),
      ),
    );
  }

  CarouselSlider _buildCarouselSlider(HomeP home) {
    return CarouselSlider(
      items: home.banners
          .map<Widget>((banner) => CachedNetworkImage(
                imageUrl: UPLOAD_URL + "/" + banner.filename,
              ))
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2075 / 920,
        viewportFraction: 1.0,
      ),
    );
  }
}
