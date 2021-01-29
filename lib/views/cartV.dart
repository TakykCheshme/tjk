import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/language.dart';
import 'package:tjk/models/cart_item.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/cartP.dart';
import 'package:tjk/shared/bottom_button.dart';
import 'package:tjk/shared/circle_button.dart';
import 'package:tjk/views/checkoutV.dart';

class CartV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppP, CartP>(
      builder: (context, app, cart, child) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(LN["sebet"][app.ln], style: titleTS),
          trailing: GestureDetector(
            onTap: cart.clear,
            child: Text(
              LN["arassala"][app.ln],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        ),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      CartItem item = cart.items[index];
                      Product product = item.product;
                      return Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: CachedNetworkImage(
                                width: 120.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                                imageUrl: product.cover,
                                placeholder: (_, __) =>
                                    CupertinoActivityIndicator(),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: titleTS.copyWith(
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                LN["baha"][app.ln] +
                                    product.price.toStringAsFixed(2) +
                                    " m.",
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                LN["olcheg"][app.ln] + item.attribute.value,
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  CircleButton(
                                      "-", () => cart.decreaseAt(index)),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 40.0,
                                    child: Text(
                                      item.count.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  CircleButton(
                                      "+", () => cart.increaseAt(index)),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => cart.removeAt(index),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Icon(CupertinoIcons.delete),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.0),
                    itemCount: cart.items.length,
                  ),
                ),
                BottomButton(
                  () => Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => CheckoutV()),
                  ),
                  LN["sargyt_etmek"][app.ln] +
                      " (${cart.totalPrice.toStringAsFixed(2)} man.)",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
