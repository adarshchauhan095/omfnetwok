import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// forgot_password test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing forgot_password module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.forgotPasswordBinding.builder();

      expect(Get.isPrepared<ForgotPasswordController>(), true);

      Utility.printILog('Testing forgot_password controller');
      var forgotPasswordController = Get.find<ForgotPasswordController>();
      forgotPasswordController.toString();

      expect(find.byKey(ForgotPasswordView.forgotPasswordViewKey), findsNothing);
      expect(find.byKey(ForgotPasswordWidget.forgotPasswordWidgetKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(ForgotPasswordView()),
      );

      expect(find.byKey(ForgotPasswordView.forgotPasswordViewKey), findsOneWidget);
      expect(find.byKey(ForgotPasswordWidget.forgotPasswordWidgetKey), findsOneWidget);
    },
  );
}
