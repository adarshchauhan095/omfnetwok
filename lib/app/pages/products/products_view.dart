import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [ProductsView] screen UI, Accessed From [TrendingView]
class ProductsView extends StatelessWidget {
  static const productsViewKey = Key('products-view-key');
  @override
  Widget build(BuildContext context) => Scaffold(
        key: productsViewKey,
        appBar: AppBar(
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: ColorsValue.whiteColor,
              size: Dimens.thirty,
            ),
            onPressed: () {
              Get.back<void>();
            },
          ),
          centerTitle: true,
          title: Text(
            StringConstants.products,
            style: Styles.primaryText20,
          ),
          actions: [
            Padding(
              padding: Dimens.edgeInsets0_0_15_0,
              child: Center(
                child: Image.asset(
                  AssetConstants.search,
                  width: Dimens.seventeen,
                  height: Dimens.seventeen,
                ),
              ),
            )
          ],
        ),
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        body: ProductsWidget(),
      );
}
