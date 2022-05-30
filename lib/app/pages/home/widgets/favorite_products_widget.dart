import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:omf_netflix/app/app.dart';

class FavoriteProductsWidget extends StatelessWidget {
  const FavoriteProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
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
              itemCount: 10,
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
              mainAxisSpacing: Dimens.six,
              crossAxisSpacing: Dimens.six,
              itemBuilder: (context, index) => Card(
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                child: SizedBox(
                  height: Dimens.hundredThirty,
                  child: Stack(
                    children: [
                      Image.asset(
                        AssetConstants.movie,
                        fit: BoxFit.cover,
                        height: Dimens.hundredThirty,
                      ),
                      Image.asset(
                        AssetConstants.omfImage,
                        width: Dimens.fiftySix,
                        height: Dimens.thirteen,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
