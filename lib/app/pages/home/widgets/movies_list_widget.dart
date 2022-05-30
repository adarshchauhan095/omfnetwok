import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

class MoviesListWidget extends StatelessWidget {
  MoviesListWidget(
      {Key? key, this.subCategoryIndex, required this.moviesSubCategory})
      : super(key: key);
  final int? subCategoryIndex;
  final List<MoviesSubCategory> moviesSubCategory;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        color: ColorsValue.whiteColor,
        child: Stack(
          children: [
            SizedBox(
              height: Dimens.hundredFourtyEight,
              width: Dimens.hundredSix,
              child: Image.asset(
                '${moviesSubCategory[subCategoryIndex!].videoUrl}',
                fit: BoxFit.cover,
              ),
            ),
            Image.asset(
              AssetConstants.omfImage,
              height: Dimens.thirteen,
              width: Dimens.fiftySix,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
}
