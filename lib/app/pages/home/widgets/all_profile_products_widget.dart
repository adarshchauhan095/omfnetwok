import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class AllProfileProductsWidget extends StatelessWidget {
  const AllProfileProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (_controller) => SingleChildScrollView(
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
                          : 2,
                  itemCount: _controller.collectionReponseModel.data!.length,
                  staggeredTileBuilder: (int index) =>
                      const StaggeredTile.fit(1),
                  mainAxisSpacing: Dimens.six,
                  crossAxisSpacing: Dimens.six,
                  itemBuilder: (context, index) => Card(
                    clipBehavior: Clip.antiAlias,
                    color: ColorsValue.blackColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimens.hundredFifty,
                          width: Dimens.twoHundred,
                          child: CachedNetworkImage(
                            width: Dimens.fourty,
                            height: Dimens.fourty,
                            imageUrl:
                                '${_controller.imageBaseUrl}/${_controller.collectionReponseModel.data![index].coverImage}',
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: Dimens.fourty,
                              backgroundImage: imageProvider,
                            ),
                            errorWidget: (context, url, dynamic error) =>
                                CircleImageAvatar(
                              borderRadius: Dimens.zero,
                              color: ColorsValue.greyColor,
                              borderColor: ColorsValue.greyColor,
                              borderWidth: Dimens.zero,
                              height: Dimens.hundredFifty,
                              child: Center(
                                child: Image.asset(
                                  AssetConstants.greyOmfLogo,
                                  width: Dimens.twoHundred,
                                  height: Dimens.fourty,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Dimens.boxHeight10,
                        Text(
                          '${_controller.collectionReponseModel.data![index].title} ${_controller.collectionReponseModel.data![index].totalCount}',
                          style: Styles.primaryText14,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
}
