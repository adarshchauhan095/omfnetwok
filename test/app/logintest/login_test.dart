import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// login test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing login module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');

      Variables.loginBinding.builder();

      expect(Get.isPrepared<LoginController>(), true);

      Utility.printILog('Testing login controller');
      var loginController = Get.find<LoginController>();

      // var validEmail = 'appscrip1@gmail.com';
      // var validPassword = 'Appscrip@1';

      // var invalidEmail = 'appscrip1@gmail';
      // var invalidPassword = 'Appscrip';

      // loginController
      //   ..checkIfEmailIsValid(validEmail)
        // ..checkIfPasswordIsValid(invalidPassword);

      expect(loginController.isEmailValid, true);
      // expect(loginController.isPasswordValid, false);
      expect(loginController.isSubmitButtonEnable, false);

      // loginController
      //   ..checkIfEmailIsValid(invalidEmail)
      //   ..checkIfPasswordIsValid(validPassword);

      expect(loginController.isEmailValid, false);
      // expect(loginController.isPasswordValid, true);
      expect(loginController.isSubmitButtonEnable, false);

      // loginController
      //   ..checkIfEmailIsValid(validEmail)
      //   ..checkIfPasswordIsValid(validPassword);

      expect(loginController.isEmailValid, true);
      // expect(loginController.isPasswordValid, true);
      expect(loginController.isSubmitButtonEnable, true);

      expect(loginController.isPhoneNumberValid, equals(false));
      // expect(loginController.isbutton, equals(false));
      // expect(loginController.phoneNumberError, equals(null));

      // loginController
      //   ..phoneNumberCheck(false)
      //   ..storeIfPhoneNumberValid('12345');

      // expect(loginController.isPhoneNumberValid, equals(false));
      // expect(loginController.isbutton, equals(false));
      // expect(loginController.phoneNumberError, equals(StringConstants.enterAValidNumber));

      // loginController
      //   ..phoneNumberCheck(true)
      //   ..storeIfPhoneNumberValid('701502787');

      // expect(loginController.isPhoneNumberValid, equals(true));
      // expect(loginController.isbutton, equals(true));
      // expect(loginController.phoneNumberError, equals(null));

      Utility.printILog('Testing login view');
      expect(find.byKey(LoginView.loginViewKey), findsNothing);
      expect(find.byKey(LoginViewWidget.loginViewWidget), findsNothing);
      expect(find.byKey(LoginViewWidget.emailWidgetKey), findsNothing);
      expect(find.byKey(LoginViewWidget.phoneNumberWidgetKey), findsNothing);
      expect(find.text(StringConstants.loginWithEmail), findsNothing);
      expect(find.text(StringConstants.loginWithFacebook), findsNothing);
      expect(find.text(StringConstants.loginWithGoogle), findsNothing);
      expect(find.text(StringConstants.loginWithApple), findsNothing);
      expect(find.byKey(LoginViewWidget.createAccountButtonKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(LoginView()),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(LoginView.loginViewKey), findsOneWidget);
      expect(find.byKey(LoginViewWidget.loginViewWidget), findsOneWidget);
      expect(find.byKey(LoginViewWidget.emailWidgetKey), findsNothing);
      expect(find.byKey(LoginViewWidget.phoneNumberWidgetKey), findsOneWidget);
      expect(find.text(StringConstants.loginWithEmail), findsOneWidget);
      expect(find.text(StringConstants.loginWithFacebook), findsOneWidget);
      expect(find.text(StringConstants.loginWithGoogle), findsOneWidget);
      expect(find.text(StringConstants.loginWithApple), findsOneWidget);
      expect(
          find.byKey(LoginViewWidget.createAccountButtonKey), findsOneWidget);

      expect(loginController.loginWithEmail, equals(false));
      loginController.swapLoginScreen();
      expect(loginController.loginWithEmail, equals(true));
      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(LoginView()),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(LoginView.loginViewKey), findsOneWidget);
      expect(find.byKey(LoginViewWidget.loginViewWidget), findsOneWidget);
      expect(find.byKey(LoginViewWidget.phoneNumberWidgetKey), findsNothing);
      expect(find.text(StringConstants.enterEmail), findsOneWidget);
      expect(find.byKey(LoginViewWidget.emailWidgetKey), findsOneWidget);
      expect(find.text(StringConstants.loginWithFacebook), findsOneWidget);
      expect(find.text(StringConstants.loginWithGoogle), findsOneWidget);
      expect(find.text(StringConstants.loginWithApple), findsOneWidget);
      expect(find.byKey(LoginViewWidget.createAccountButtonKey), findsOneWidget,
          skip: true);
    },
  );
}
