import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:omf_netflix/app/app.dart';

/// [MyListWidget] is main widget for [MyListView].
class MyListWidget extends StatelessWidget {
  const MyListWidget({Key? key}) : super(key: key);
  static const myListWidgetKey = Key('mylist-widget-key');
  @override
  Widget build(BuildContext context) => Padding(
        key: myListWidgetKey,
        padding: Dimens.edgeInsets15_0_15_0,
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
                mainAxisSpacing: Dimens.five,
                crossAxisSpacing: Dimens.five,
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
        ),
      );
}
