import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// Shows the Peding and Continueing episodes and season of videos/series (also)
///
/// downloaded or not downloaded.
class EpisodesView extends StatelessWidget {
  static const episodeViewKey = Key('episodes-view-key');

  @override
  Widget build(BuildContext context) => Padding(
        key: episodeViewKey,
        padding: Dimens.edgeInsets15_0_15_0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownChip(title: '${StringConstants.season} 1'),
              Dimens.boxHeight20,
              SizedBox(
                height: Dimens.eighty,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Dimens.eighty,
                          width: Dimens.hundredFourty,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.seven),
                              topRight: Radius.circular(Dimens.seven),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.seven),
                              topRight: Radius.circular(Dimens.seven),
                            ),
                            child: Image.asset(
                              AssetConstants.movie,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: Dimens.twentyFive,
                          left: Dimens.fifty,
                          child: Icon(
                            Icons.play_circle_outline,
                            color: ColorsValue.whiteColor,
                            size: Dimens.thirty,
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxWidth10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${StringConstants.episode} 1',
                            style: Styles.primaryText14,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            '42m',
                            style: Styles.secondaryText13,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Image.asset(
                        AssetConstants.downloaded,
                        height: Dimens.thirty,
                      ),
                    ),
                  ],
                ),
              ),
              Dimens.boxHeight5,
              Text(
                StringConstants.theProfessorRecruits,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight20,
              SizedBox(
                height: Dimens.eighty,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Dimens.eighty,
                          width: Dimens.hundredFourty,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.seven),
                              topRight: Radius.circular(Dimens.seven),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.seven),
                              topRight: Radius.circular(Dimens.seven),
                            ),
                            child: Image.asset(
                              AssetConstants.movie,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: Dimens.twentyFive,
                          left: Dimens.fifty,
                          child: Icon(
                            Icons.play_circle_outline,
                            color: ColorsValue.whiteColor,
                            size: Dimens.thirty,
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxWidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${StringConstants.episode} 2',
                          style: Styles.primaryText14,
                        ),
                        Dimens.boxHeight5,
                        Text(
                          '42m',
                          style: Styles.secondaryText13,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: Image.asset(
                        AssetConstants.download,
                        height: Dimens.twenty,
                      ),
                    ),
                  ],
                ),
              ),
              Dimens.boxHeight5,
              Text(
                StringConstants.theProfessorRecruits,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight20,
              SizedBox(
                height: Dimens.eighty,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Dimens.eighty,
                          width: Dimens.hundredFourty,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.seven),
                              topRight: Radius.circular(Dimens.seven),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.seven),
                              topRight: Radius.circular(Dimens.seven),
                            ),
                            child: Image.asset(
                              AssetConstants.movie,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: Dimens.twentyFive,
                          left: Dimens.fifty,
                          child: Icon(
                            Icons.play_circle_outline,
                            color: ColorsValue.whiteColor,
                            size: Dimens.thirty,
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxWidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${StringConstants.episode} 3',
                          style: Styles.primaryText14,
                        ),
                        Dimens.boxHeight5,
                        Text(
                          '42m',
                          style: Styles.secondaryText13,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: Image.asset(
                        AssetConstants.download,
                        height: Dimens.twenty,
                      ),
                    ),
                  ],
                ),
              ),
              Dimens.boxHeight5,
              Text(
                StringConstants.theProfessorRecruits,
                style: Styles.primaryText13,
              ),
            ],
          ),
        ),
      );
}
