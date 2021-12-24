import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// loginotp test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing loginotp module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.loginOtpBinding.builder();

      expect(Get.isPrepared<LoginOtpController>(), true);

      Utility.printILog('Testing login controller');
      var loginOtpController = Get.find<LoginOtpController>();

      expect(loginOtpController.formKey, isA<GlobalKey<FormState>>());
      expect(loginOtpController.hasError, isA<bool>());
      expect(loginOtpController.otp, isA<String>());

      var validOtp = '1234';
      var invalidOtp = '1256';

      loginOtpController.otpValidation(invalidOtp);
      expect(loginOtpController.hasError, equals(true));
      expect(loginOtpController.otp, equals(invalidOtp));

      loginOtpController.otpValidation(validOtp);
      expect(loginOtpController.hasError, equals(false));

      expect(find.byKey(LoginOtpView.loginOtpViewKey), findsNothing);
      expect(find.byKey(LoginOtpWidget.pinCodeTextFieldKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(LoginOtpView()),
      );

      expect(find.byKey(LoginOtpView.loginOtpViewKey), findsOneWidget);
      expect(find.byKey(LoginOtpWidget.pinCodeTextFieldKey), findsOneWidget);
    },
  );
}
