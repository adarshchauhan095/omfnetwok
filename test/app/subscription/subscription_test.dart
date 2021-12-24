import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// subscription test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing Subscription module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.subscriptionBinding.builder();

      expect(Get.isPrepared<SubscriptionController>(), true);

      Utility.printILog('Testing SubscriptionController controller');
      var subscriptionController = Get.find<SubscriptionController>();
      subscriptionController.toString();

      expect(find.byKey(SubscriptionView.subscriptionViewKey), findsNothing);
      expect(
          find.byKey(SubscriptionWidget.subscriptionWidgetKey), findsNothing);
      expect(
          find.byKey(SubscriptionWidget.subscriptionButtonKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(SubscriptionView()),
      );

      expect(find.byKey(SubscriptionView.subscriptionViewKey), findsOneWidget);
      expect(
          find.byKey(SubscriptionWidget.subscriptionWidgetKey), findsOneWidget);
      expect(
          find.byKey(SubscriptionWidget.subscriptionButtonKey), findsOneWidget);

      var subsButton = find.byKey(SubscriptionWidget.subscriptionButtonKey);

      await tester.tap(subsButton);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(SubscriptionView()),
      );

      await tester.pumpAndSettle();

      expect(
          find.byKey(SubscriptionSheet.subscriptionSheetKey), findsOneWidget);
    },
  );
}
