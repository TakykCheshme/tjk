import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/models/category.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/homeP.dart';
import 'package:tjk/views/detailV.dart';

class HomeV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeP home = Provider.of<HomeP>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Türkmenbaşy jins toplumy", style: titleTS),
        trailing: Icon(CupertinoIcons.cart, size: 28.0),
      ),
      child: Consumer<HomeP>(
        builder: (context, home, child) => home.loading
            ? CupertinoActivityIndicator()
            : ListView(
                children: [
                  _buildCarouselSlider(home),
                  _buildCupertinoSegmentedControl(home),
                  _buildProductsGridView(home)
                ],
              ),
      ),
    );
  }

  Padding _buildProductsGridView(HomeP home) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.6,
          ),
          itemCount: home.categories[home.selectedCategory].products.length,
          itemBuilder: (context, index) {
            Category category = home.categories[home.selectedCategory];
            Product product = category.products[index];

            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => DetailV(product)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 0.75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: product.cover,
                            placeholder: (context, str) =>
                                CupertinoActivityIndicator(),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.favorite_border),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      product.price.toStringAsFixed(2) + " m.",
                      style: titleTS,
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      product.name,
                      style: subtitleTS,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Padding _buildCupertinoSegmentedControl(HomeP home) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CupertinoSlidingSegmentedControl(
        groupValue: home.selectedCategory,
        children: {
          for (int i = 0; i < home.categories.length; i++)
            i: Text(home.categories[i].name),
        },
        onValueChanged: (category) => home.selectedCategory = category,
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
