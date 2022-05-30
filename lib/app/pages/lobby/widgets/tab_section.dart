import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [TabSection] is the [Tab] UI under the [LobbyView] to show extra things.
class TabSection extends StatelessWidget {
  const TabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      // DefaultTabController(
      //       length: 3,
      //       child: SingleChildScrollView(
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             Container(
      //                 height: Dimens.thirtyEight,
      //                 decoration: const BoxDecoration(
      //                   color: ColorsValue.greyBoxColor,
      //                 ),
      //                 child: TabBar(
      //                   indicator: BoxDecoration(
      //                     border: Border(
      //                       top: BorderSide(
      //                           color: ColorsValue.primaryColor, width: Dimens.two),
      //                     ),
      //                   ),
      //                   unselectedLabelColor: ColorsValue.primaryTextColor,
      //                   labelStyle: Styles.primaryText11,
      //                   labelColor: ColorsValue.primaryColor,
      //                   labelPadding: Dimens.edgeInsets0_0_10_0,
      //                   tabs: [
      //                     Tab(
      //                       text: StringConstants.products.toUpperCase(),
      //                     ),
      //                     Tab(text: StringConstants.episodes.toUpperCase()),
      //                     Tab(text: StringConstants.moreLikeThis.toUpperCase()),
      //                   ],
      //                 )),
      //             SizedBox(
      //               // height: Get.height,
      //               height: Dimens.fourHundred,
      //               child: TabBarView(
      //                 children: [
      //                   ProductView(),
      //                   EpisodesView(),
      //                   MoreLikeThisView(),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      GetBuilder<LobbyController>(
        builder: (_controller) => ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            CircleImageAvatar(
              borderRadius: Dimens.zero,
              color: ColorsValue.greyColor,
              borderColor: ColorsValue.greyColor,
              width: double.infinity,
              height: Dimens.fourty,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.changeLobbyCategory(1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: _controller.categoryNumber == 1
                                ? ColorsValue.primaryColor
                                : ColorsValue.greyColor,
                            width: Dimens.two,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text('products'.tr.toUpperCase(),
                            style: _controller.categoryNumber == 1
                                ? Styles.boldPrimary11
                                : Styles.boldPrimaryText11),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.changeLobbyCategory(2);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: _controller.categoryNumber == 2
                                ? ColorsValue.primaryColor
                                : ColorsValue.greyColor,
                            width: Dimens.two,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text('episodes'.tr.toUpperCase(),
                            style: _controller.categoryNumber == 2
                                ? Styles.boldPrimary11
                                : Styles.boldPrimaryText11),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.changeLobbyCategory(3);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: _controller.categoryNumber == 3
                                ? ColorsValue.primaryColor
                                : ColorsValue.greyColor,
                            width: Dimens.two,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text('moreLikeThis'.tr.toUpperCase(),
                            style: _controller.categoryNumber == 3
                                ? Styles.boldPrimary11
                                : Styles.boldPrimaryText11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Dimens.boxHeight20,
            _controller.categoryNumber == 1
                ? ProductView()
                : _controller.categoryNumber == 2
                    ? EpisodesView()
                    : MoreLikeThisView(),
          ],
        ),
      );
}
