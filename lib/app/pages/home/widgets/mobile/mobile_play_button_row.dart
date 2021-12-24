import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

class MobilePlayButtonRow extends StatelessWidget {
  const MobilePlayButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: Dimens.twenty,
        child: Row(
          children: [
            Dimens.boxWidth16,
            PlayListIconButton(
              iconWidget: const Icon(
                Icons.add,
                color: ColorsValue.whiteColor,
              ),
              title: StringConstants.myList,
              onTap: () {
                if (kIsWeb) {
                  if (Responsive.isWeb(context) ||
                      Responsive.isTablet(context)) {
                    lobbyDialog(context);
                  } else {
                    RouteManagement.goToLobby('');
                  }
                } else {
                  RouteManagement.goToLobby('');
                }
              },
            ),
            Dimens.boxWidth100,
            PlayButton(),
            Dimens.boxWidth100,
            PlayListIconButton(
              iconWidget: const Icon(
                Icons.info_outline_rounded,
                color: ColorsValue.whiteColor,
              ),
              title: StringConstants.info,
              onTap: () {},
            ),
          ],
        ),
      );

  void lobbyDialog(
    BuildContext context,
  ) {
    showDialog<String>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: Responsive.isWeb(context)
              ? Dimens.percentWidth(.60)
              : Responsive.isTablet(context)
                  ? Dimens.percentWidth(.80)
                  : Dimens.percentWidth(.90),
          height: Responsive.isWeb(context)
              ? Dimens.percentHeight(.90)
              : Responsive.isTablet(context)
                  ? Dimens.percentHeight(.90)
                  : Dimens.percentHeight(.90),
          color: ColorsValue.scaffoldBackgroundColor,
          child: LobbyViewWidget(),
        ),
      ),
    );
  }
}
