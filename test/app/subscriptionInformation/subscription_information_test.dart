import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// subscription information test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing products module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.subscriptionInformationBinding.builder();

      expect(Get.isPrepared<SubscriptionInformationController>(), true);

      Utility.printILog('Testing subscription information controller');
      var subscriptionInformationController = Get.find<SubscriptionInformationController>();
      subscriptionInformationController.toString();

      expect(find.byKey(SubscriptionInformationView.subscriptionInformationViewKey), findsNothing);
      expect(find.byKey(SubscriptionInformationWidget.subscriptionInformationWidgetKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(SubscriptionInformationView()),
      );

      expect(find.byKey(SubscriptionInformationView.subscriptionInformationViewKey), findsOneWidget);
      expect(find.byKey(SubscriptionInformationWidget.subscriptionInformationWidgetKey), findsOneWidget);

    },
  );
}
