import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// [LobbyView] Screen UI is used to show the playing videos, 
/// 
/// download button, producs, episodes, share, comment sections, 
/// 
/// share video etc.
class LobbyView extends StatelessWidget {
  static const lobbyViewKey = Key('lobby-view-key');
  @override
  Widget build(BuildContext context) => SafeArea(
    key: lobbyViewKey,
        child: Scaffold(
            backgroundColor: ColorsValue.scaffoldBackgroundColor,
            body: LobbyViewWidget(),),
      );
}
