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
    'Testing change password module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.changePasswordBinding.builder();

      expect(Get.isPrepared<ChangePasswordController>(), true);

      Utility.printILog('Testing change password controller');
      var changepasswordController = Get.find<ChangePasswordController>();
      changepasswordController.toString();

      expect(
          find.byKey(ChangePasswordView.changePasswordViewKey), findsNothing);
      expect(find.byKey(ChangePasswordWidget.changePasswordWidgetKey),
          findsNothing);
      expect(find.byKey(ChangedPasswordDialog.changedPasswordDialogKey),
          findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(ChangePasswordView()),
      );

      expect(
          find.byKey(ChangePasswordView.changePasswordViewKey), findsOneWidget);
      expect(find.byKey(ChangePasswordWidget.changePasswordWidgetKey),
          findsOneWidget);

      final validPassword = 'Appscrip@1';
      final invalidPassword = 'appscrip@';

      changepasswordController.checkIfPasswordIsValid(invalidPassword);
      expect(changepasswordController.isCurrentPasswordValid, false);
      expect(changepasswordController.currentPasswordErrors,
          StringConstants.shouldHaveOneUppercaseLetter);

      changepasswordController.checkIfPasswordIsValid(validPassword);
      expect(changepasswordController.isCurrentPasswordValid, true);

      changepasswordController.checkIfNewPasswordIsValid(invalidPassword);
      expect(changepasswordController.isNewPasswordValid, false);
      expect(changepasswordController.newPasswordErrors,
          StringConstants.shouldHaveOneUppercaseLetter);

      changepasswordController.checkIfNewPasswordIsValid(validPassword);
      expect(changepasswordController.isNewPasswordValid, true);

      changepasswordController.checkPasswordConfirmation(invalidPassword);
      expect(changepasswordController.isConfirmedPassword, false);
      expect(changepasswordController.confirmPasswordError,
          StringConstants.passwordAndConfirmPasswordShouldBeSame);

      changepasswordController.checkPasswordConfirmation(validPassword);
      expect(changepasswordController.isConfirmedPassword, true);
      changepasswordController.enableSubmitButton();
      expect(changepasswordController.isSubmitButtonEnable, true);

      final changePasswordButton = find.text(StringConstants.changePassword).last;

      await tester.tap(changePasswordButton);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(ChangedPasswordDialog()),
      );


      await tester.pumpAndSettle();

      expect(find.byKey(ChangedPasswordDialog.changedPasswordDialogKey),
          findsOneWidget);
    },
  );
}
