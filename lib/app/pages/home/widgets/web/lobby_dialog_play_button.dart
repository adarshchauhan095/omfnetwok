import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

class LobbyDialogPlayButton extends StatelessWidget {
  const LobbyDialogPlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorsValue.whiteColor)),
            child: SizedBox(
              width: Dimens.seventy,
              height: Dimens.thirtyFive,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: ColorsValue.blackColor,
                    size: Dimens.twentyFive,
                  ),
                  Text(
                    StringConstants.play,
                    style: Styles.black15,
                  )
                ],
              ),
            ),
          ),
          Dimens.boxWidth35,
          const LobbySocialRow(),
        ],
      );
}
