import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// appsettings test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing appsettings module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.appsettingsBinding.builder();

      expect(Get.isPrepared<AppSettingsController>(), true);

      Utility.printILog('Testing appsettings controller');
      var appSettingsController = Get.find<AppSettingsController>();
      appSettingsController.toString();

      expect(find.byKey(AppSettingsView.appSettingsViewKey), findsNothing);
      expect(find.byKey(AppSettingsWidget.appSettingsWidgetKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(AppSettingsView()),
      );

      expect(find.byKey(AppSettingsView.appSettingsViewKey), findsOneWidget);
      expect(
          find.byKey(AppSettingsWidget.appSettingsWidgetKey), findsOneWidget);
    },
  );
}
