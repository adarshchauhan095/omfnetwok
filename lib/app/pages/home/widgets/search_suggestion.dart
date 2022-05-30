import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.searchSuggestions,
              style: Styles.primaryText14,
            ),
            Dimens.boxHeight10,
            StaggeredGridView.countBuilder(
              controller: ScrollController(),
              shrinkWrap: true,
              crossAxisCount: Responsive.isWeb(context)
                  ? 8
                  : Responsive.isTablet(context)
                      ? 5
                      : 3,
              itemCount: 25,
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
              mainAxisSpacing: Dimens.twenty,
              crossAxisSpacing: Dimens.twenty,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Responsive.isWeb(context) || Responsive.isTablet(context)
                      ? suggestedItemDialog(context)
                      : Get.bottomSheet<void>(
                          const SearchSuggestionItemDialogContent(),
                          isDismissible: true,
                          enableDrag: true,
                        );
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: SizedBox(
                    height: Dimens.hundredFifty,
                    child: Image.asset(
                      AssetConstants.movie3,
                      scale: 1,
                      height: Dimens.eighty,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void suggestedItemDialog(
    BuildContext context,
  ) {
    showDialog<String>(
      barrierDismissible: true,
      barrierColor: Colors.black38,
      context: context,
      builder: (BuildContext context) => Dialog(
          insetPadding: EdgeInsets.all(Dimens.ten),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.ten),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: const SearchSuggestionItemDialogContent()),
    );
  }
}
