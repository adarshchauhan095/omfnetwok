import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// lobby test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing lobby module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.lobbyBinding.builder();

      expect(Get.isPrepared<LobbyController>(), true);

      Utility.printILog('Testing lobby controller');
      var lobbyController = Get.find<LobbyController>();
      lobbyController.toString();

      expect(find.byKey(LobbyView.lobbyViewKey), findsNothing);
      expect(find.byKey(LobbyViewWidget.lobbyWidgetKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(LobbyView()),
      );

      expect(find.byKey(LobbyView.lobbyViewKey), findsOneWidget);
      expect(find.byKey(LobbyViewWidget.lobbyWidgetKey), findsOneWidget);

      expect(find.byType(DefaultTabController), findsOneWidget);

      tester.widget(find.byType(TabBar)) as TabBar;

      //  await tester.pumpWidget(
      //   Variables.getTheMaterialAppWrapper(TabBarView(children :[ProductView()])),
      // );

      // expect(find.byKey(ProductView.productViewTabKey), findsOneWidget);

      // expect(find.byKey(EpisodesView.episodeViewKey), findsOneWidget);

      expect(lobbyController.isMyListed, equals(false));
      lobbyController.addToMylist();
      expect(lobbyController.isMyListed, equals(true));

      expect(lobbyController.isLiked, equals(false));
      lobbyController.makeFavorite(true);
      expect(lobbyController.isLiked, equals(true));
    },
  );
}
