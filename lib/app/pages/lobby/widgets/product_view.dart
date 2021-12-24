import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:omf_netflix/app/app.dart';

/// [ProductView] list UI in the [LobbyView].
class ProductView extends StatelessWidget {
  static const productViewTabKey = Key('product-view-tab-key');

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebMob(
                web: Responsive.isWeb(context) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)
                    ? Dimens.boxHeight20
                    : Dimens.box0,
                android: Dimens.boxHeight10),
            Responsive.isWeb(context) ||
                    Responsive.isTablet(context) ||
                    Responsive.isMobile(context)
                ? Padding(
                    padding: kIsWeb
                        ? Dimens.edgeInsets35_0_15_0
                        : Dimens.edgeInsets15_0_15_0,
                    child: StaggeredGridView.countBuilder(
                      // controller: ScrollController(),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: Responsive.isWeb(context)
                          ? 2
                          : Responsive.isTablet(context)
                              ? 1
                              : 1,
                      itemCount: 5,
                      staggeredTileBuilder: (int index) =>
                          const StaggeredTile.fit(1),
                      mainAxisSpacing: Dimens.twenty,
                      crossAxisSpacing: Dimens.twenty,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          if (Responsive.isMobile(context)) {
                          } else {
                            
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                          height: Dimens.hundred,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsValue.greyBoxColor,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.seven),
                                ),
                                height: Dimens.hundred,
                                width: Dimens.hundred,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.seven),
                                  child: Image.asset(
                                    AssetConstants.shoe,
                                    height: Dimens.fifty,
                                    width: Dimens.fifty,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Dimens.boxWidth10,
                              Expanded(
                                child: Wrap(
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
                                        Flexible(
                                          child: Text(
                                            '\$ 3,299',
                                            style: Styles.primaryText13,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Dimens.boxWidth5,
                                        Flexible(
                                          child: Text(
                                            '\$ 3,299',
                                            style: Styles
                                                .secondaryText12LineThrough,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                      ),
                    ))
                : Dimens.box0
          ],
        ),
      );


}
