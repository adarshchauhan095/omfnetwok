import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          GetBuilder<HomeController>(
            builder: (_controller) => Padding(
              padding: Dimens.edgeInsets35_11_15_11,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.sort_rounded,
                      color: ColorsValue.whiteColor,
                      size: Dimens.thirty,
                    ),
                  ),
                  Image.asset(
                    AssetConstants.omfLogo,
                    width: Dimens.hundredFifty,
                    height: Dimens.thirty,
                  ),
                  Responsive.isMobile(context)
                      ? Dimens.box0
                      : Text(
                          StringConstants.shows,
                          style: Styles.primaryText12,
                        ),
                  Responsive.isMobile(context)
                      ? Dimens.box0
                      : Dimens.boxWidth20,
                  Responsive.isMobile(context)
                      ? Dimens.box0
                      : Text(
                          StringConstants.omfApp,
                          style: Styles.primaryText12,
                        ),
                  Responsive.isMobile(context)
                      ? Dimens.box0
                      : Dimens.boxWidth20,
                  Responsive.isMobile(context)
                      ? Dimens.box0
                      : GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              const DropdownShows(),
                              isScrollControlled: true,
                              barrierColor: ColorsValue.blackColor,
                              isDismissible: true,
                              enableDrag: false,
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                StringConstants.shop,
                                style: Styles.primaryText12,
                              ),
                              Dimens.boxWidth5,
                              const Icon(
                                Icons.arrow_drop_down,
                                color: ColorsValue.whiteColor,
                              ),
                            ],
                          ),
                        ),
                  const Spacer(),
                  _controller.isSearchIconTapped
                      ? Responsive.isMobile(context)
                          ? Dimens.box0
                          : Container(
                              width: Responsive.isTablet(context)
                                  ? Dimens.hundred
                                  : Dimens.twoHundred,
                              height: Dimens.thirty,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorsValue.whiteColor,
                                ),
                                color: ColorsValue.blackColor,
                              ),
                              child: FormFieldWidget(
                                onChange: _controller.searchSuggestion,
                                onEditingComplete: () {
                                  _controller.enableSearchBar();
                                },
                                prefixIcon: const Icon(
                                  Icons.search_outlined,
                                  color: ColorsValue.whiteColor,
                                ),
                                fillColor: ColorsValue.blackColor,
                                formStyle: Styles.primaryText14,
                                textInputType: TextInputType.text,
                                formBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorsValue.blackColor,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorsValue.blackColor,
                                  ),
                                ),
                              ),
                            )
                      : Responsive.isMobile(context)
                          ? Dimens.box0
                          : GestureDetector(
                              onTap: () {
                                _controller.enableSearchBar();
                              },
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Image.asset(
                                  AssetConstants.search,
                                  width: Dimens.fifteen,
                                  height: Dimens.fifteen,
                                ),
                              ),
                            ),
                  Dimens.boxWidth20,
                  Responsive.isTablet(context)
                      ? Dimens.box0
                      : ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                Dimens.edgeInsets4_0_4_0),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                ColorsValue.whiteColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColorsValue.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: ColorsValue.whiteColor),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: ColorsValue.whiteColor,
                                size: Dimens.ten,
                              ),
                              Dimens.boxWidth3,
                              Text(
                                StringConstants.english,
                                style: Styles.primaryText10,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorsValue.whiteColor,
                                size: Dimens.fifteen,
                              )
                            ],
                          ),
                        ),
                  Dimens.boxWidth10,
                  _controller.isLoggedIn
                      ? GestureDetector(
                          onTap: () {
                            _controller.setPageIndex(4);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Dimens.hundred,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Dimens.hundred,
                                  ),
                                  border: Border.all(
                                      color: ColorsValue.whiteColor,
                                      width: Dimens.two)),
                              child: Image.asset(
                                AssetConstants.person,
                                width: Dimens.twenty,
                                height: Dimens.twenty,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            await loginDialog(
                              context,
                              // Get.find<LoginController>(),
                            );
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  Dimens.edgeInsets4_0_4_0),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ColorsValue.whiteColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorsValue.primaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                          color: ColorsValue.primaryColor)))),
                          child: Text(
                            StringConstants.signIn,
                            style: Styles.primaryText10,
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      );

  Future<void> loginDialog(
    BuildContext context,
    // LoginController controller,
  ) async {
    await showDialog<String>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: LoginDialogContent(
            // controller: controller,
            ),
      ),
    );
  }

 
}
