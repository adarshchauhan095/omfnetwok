import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// ProductsWidget is main widget for [ProductsView].
class ProductsWidget extends StatelessWidget {
  static const productsWidgetKey = Key('products-widget-key');
  @override
  Widget build(BuildContext context) => Padding(
        key: productsWidgetKey,
        padding: Dimens.edgeInsets15_20_15_0,
        child: ListView.separated(
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.seven),
            ),
            height: Dimens.hundred,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorsValue.greyBoxColor,
                    borderRadius: BorderRadius.circular(Dimens.seven),
                  ),
                  height: Dimens.hundred,
                  width: Dimens.hundred,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.seven),
                    child: Image.asset(
                      AssetConstants.shoe,
                      height: Dimens.fifty,
                      width: Dimens.fifty,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Dimens.boxWidth10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.puma,
                      style: Styles.secondaryText12,
                    ),
                    Dimens.boxHeight8,
                    Text(
                      StringConstants.cityRiderUnisexSneakers,
                      style: Styles.primaryText14,
                    ),
                    Dimens.boxHeight8,
                    Row(
                      children: [
                        Text(
                          '\$ 3,299',
                          style: Styles.primaryText13,
                        ),
                        Dimens.boxWidth5,
                        Text(
                          '\$ 3,299',
                          style: Styles.secondaryText12LineThrough,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: ColorsValue.whiteColor,
                  size: Dimens.twentyFive,
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => Dimens.boxHeight15,
          itemCount: 7,
        ),
      );
}
