import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:omf_netflix/app/app.dart';

class WebTrendingProducts extends StatelessWidget {
  const WebTrendingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Responsive.isWeb(context) ||
                    Responsive.isTablet(context) ||
                    Responsive.isMobile(context)
                ? const WebAppBar()
                : Dimens.box0,
            Responsive.isWeb(context) ||
                    Responsive.isTablet(context) ||
                    Responsive.isMobile(context)
                ? Dimens.boxHeight20
                : Dimens.box0,
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
                          ? 3
                          : Responsive.isTablet(context)
                              ? 2
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
                            lobbyDialog(context);
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

  void lobbyDialog(
    BuildContext context,
  ) {
    showDialog<String>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: Responsive.isWeb(context)
              ? Dimens.percentWidth(.60)
              : Responsive.isTablet(context)
                  ? Dimens.percentWidth(.80)
                  : Dimens.percentWidth(.90),
          height: Responsive.isWeb(context)
              ? Dimens.percentHeight(.90)
              : Responsive.isTablet(context)
                  ? Dimens.percentHeight(.90)
                  : Dimens.percentHeight(.90),
          color: ColorsValue.scaffoldBackgroundColor,
          child: LobbyViewWidget(),
        ),
      ),
    );
  }
}
