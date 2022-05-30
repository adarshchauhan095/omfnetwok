import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// List of Continue watching and pending watching videos
/// as Season and Episodes.
class ContinuesWatching extends StatelessWidget {
   ContinuesWatching({Key? key,this.subCategoryIndex, required this.moviesSubCategory }) : super(key: key);
   final int? subCategoryIndex;
  final List<MoviesSubCategory> moviesSubCategory;

  @override
  Widget build(BuildContext context) => Card(
                              clipBehavior: Clip.antiAlias,
                              color: ColorsValue.greyBoxColor,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Opacity(
                                        opacity: 0.1,
                                        child: SizedBox(
                                          height: Dimens.hundredFiftyOne,
                                          width: Dimens.hundredSix,
                                          child: Image.asset(
                                            '${moviesSubCategory[subCategoryIndex!].videoUrl}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: Dimens.fourtyNine,
                                        left: Dimens.twentySix,
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.fiftyFour,
                                        ),
                                      ),
                                      Positioned(
                                        top: Dimens.hundredTwenty,
                                        left: Dimens.thirtyEight,
                                        child: Text('S1:E2',
                                            style: Styles.primaryText11),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimens.hundredSix,
                                    child: LinearProgressIndicator(
                                      minHeight: Dimens.two,
                                    ),
                                  ),
                                  Dimens.boxHeight3,
                                  SizedBox(
                                    width: Dimens.hundredSix,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.nineteen,
                                        ),
                                        Icon(
                                          Icons.more_vert,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.nineteen,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
}
