import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget that represents the Suggested videos for same as plyaing video.
class MoreLikeThisView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets15_20_10_0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StaggeredGridView.countBuilder(
                controller: ScrollController(),
                shrinkWrap: true,
                crossAxisCount: Responsive.isWeb(context)
                    ? 5
                    : Responsive.isTablet(context)
                        ? 4
                        : 3,
                itemCount: 25,
                staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                mainAxisSpacing: Dimens.twenty,
                crossAxisSpacing: Dimens.twenty,
                itemBuilder: (context, index) => Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: SizedBox(
                    width: Dimens.hundredThirty,
                    height: Dimens.twoHundred,
                    child: Image.asset(
                      AssetConstants.movie,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
