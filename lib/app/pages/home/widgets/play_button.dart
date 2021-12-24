import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [IconButton] that is used in [MainHomeView]  and [SearchView] to go to the
/// [LobbyView] screen
class PlayButton extends StatelessWidget {
  PlayButton({
    Key? key,
    this.onTap,
    this.buttonColor = ColorsValue.whiteColor,
    this.color = ColorsValue.blackColor,
  }) : super(key: key);
  final void Function()? onTap;
  final Color? buttonColor;
  final Color? color;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => GestureDetector(
          onTap: () {
            RouteManagement.goToLobby(AssetConstants.movieLink);
          },
          child: Container(
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(Dimens.five)),
            width: Responsive.isWeb(context)
                ? Dimens.percentWidth(0.06)
                : Responsive.isTablet(context)
                    ? Dimens.percentWidth(0.10)
                    : Dimens.percentWidth(Dimens.pointTwo),
            height: Dimens.thirtyFive,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: Dimens.edgeInsets0_0_4_0,
                  child: Icon(
                    Icons.play_arrow,
                    color: color,
                  ),
                ),
                Text(
                  StringConstants.play,
                  style: TextStyle(color: color),
                ),
              ],
            ),
          ),
        ),
      );
}
