import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/language.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/searchP.dart';
import 'package:tjk/shared/error_message.dart';
import 'package:tjk/shared/product_list_tile.dart';
import 'package:tjk/shared/tjk_nvigation_bar.dart';

import '../const.dart';

class SearchV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return ChangeNotifierProxyProvider<AppP, SearchP>(
      create: (context) => SearchP(),
      update: (context, app, search) => search..ln = app.ln,
      child: Consumer<SearchP>(
        builder: (context, search, _) => CupertinoPageScaffold(
          navigationBar: TJKNavigationBar(LN["gozleg"][search.ln]),
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(height: 90.0),
                _buildSearchFiled(_controller, search),
                search.loading
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: CupertinoActivityIndicator(),
                      )
                    : search.error != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: ErrorMessage(
                                () => search.search(_controller.text)),
                          )
                        : _buildProductList(search)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductList(SearchP search) {
    if (search.products == null) return Container();
    if (search.products.isEmpty)
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          LN["netije_yok"][search.ln],
          style: titleTS,
        ),
      );
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (_, __) => SizedBox(height: 10.0),
          padding: EdgeInsets.zero,
          itemCount: search.products.length,
          itemBuilder: (context, index) {
            Product product = search.products[index];
            return ProductListTile(product);
          }),
    );
  }

  Padding _buildSearchFiled(TextEditingController _controller, SearchP search) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          CupertinoTextField(
            controller: _controller,
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 40.0, 8.0),
            placeholder: LN["meselem_jalbar"][search.ln],
            autofocus: true,
            style: titleTS,
            onSubmitted: (word) => search.search(word),
          ),
          Positioned(
            right: 0.0,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(CupertinoIcons.search),
              onPressed: () => search.search(_controller.text),
            ),
          ),
        ],
      ),
    );
  }
}
