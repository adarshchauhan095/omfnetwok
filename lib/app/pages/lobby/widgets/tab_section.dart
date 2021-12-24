import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// [TabSection] is the [Tab] UI under the [LobbyView] to show extra things.
class TabSection extends StatelessWidget {
  const TabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  height: Dimens.thirtyEight,
                  decoration: const BoxDecoration(
                    color: ColorsValue.greyBoxColor,
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: ColorsValue.primaryColor, width: Dimens.two),
                      ),
                    ),
                    unselectedLabelColor: ColorsValue.primaryTextColor,
                    labelStyle: Styles.primaryText11,
                    labelColor: ColorsValue.primaryColor,
                    labelPadding: Dimens.edgeInsets0_0_10_0,
                    tabs: [
                      Tab(
                        text: StringConstants.products.toUpperCase(),
                      ),
                      Tab(text: StringConstants.episodes.toUpperCase()),
                      Tab(text: StringConstants.moreLikeThis.toUpperCase()),
                    ],
                  )),
              SizedBox(
                // height: Get.height,
                height: Dimens.fourHundred,
                child: TabBarView(
                  children: [
                    ProductView(),
                    EpisodesView(),
                    MoreLikeThisView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
