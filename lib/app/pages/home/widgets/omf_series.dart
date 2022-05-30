import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Big Picture List of Series widget named as [OmfSeries].
class OmfSeries extends StatelessWidget {
  const OmfSeries(
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
              height: Dimens.threeHundredTwentyEight,
              width: Dimens.twoHundredThirtySix,
              child: Image.asset(
                '${moviesSubCategory[subCategoryIndex!].videoUrl}',
                fit: BoxFit.cover,
              ),
            ),
            Image.asset(
              AssetConstants.omfImage,
              height: Dimens.twentyTwo,
              width: Dimens.nintyFour,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
}
