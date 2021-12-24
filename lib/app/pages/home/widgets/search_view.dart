import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Search screen UI [SearchView].
class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Material(
          color: ColorsValue.scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WebMob(
                  web: (Responsive.isWeb(context) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context))
                      ? const WebAppBar()
                      : Dimens.box0,
                  android: Dimens.box0,
                ),
                WebMob(
                  web: Dimens.boxHeight20,
                  android: Dimens.boxHeight5,
                ),
                WebMob(
                  web: Responsive.isWeb(context) || Responsive.isTablet(context)
                      ? Dimens.boxHeight20
                      : Responsive.isMobile(context)
                          ? SearchBox(padding: Dimens.edgeInsets35_0_15_0)
                          : Dimens.box0,
                  android: SearchBox(padding: Dimens.edgeInsets15_0_15_0),
                ),
                _controller.suggestionView
                    ? Padding(
                        padding: kIsWeb
                            ? Dimens.edgeInsets35_11_15_11
                            : Dimens.edgeInsets15_11_15_11,
                        child: const SearchSuggestion(),
                      )
                    : Padding(
                        padding: kIsWeb
                            ? Dimens.edgeInsets35_11_15_11
                            : Dimens.edgeInsets15_11_15_11,
                        child: const TopSearches(),
                      ),
              ],
            ),
          ),
        ),
      );
}
