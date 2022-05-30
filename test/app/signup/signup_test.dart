import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// Testing sign up
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  group(
    'Sing up view/controller test',
    () {
      testWidgets(
        'Testing sign up controller initialization',
        (tester) async {
          Utility.printILog('Initial initialization starting.');
          Variables.layerBinding.builder();
          Variables.signUpController.builder();

          expect(Get.isPrepared<SignupController>(), true);
        },
      );

      testWidgets(
        'Testing sign up controller methods',
        (tester) async {
          var signupController = Get.find<SignupController>();
          await tester.pumpWidget(
            Variables.getTheMaterialAppWrapper(const SignupView()),
          );
          await tester.pumpAndSettle();

          Utility.printILog('Testing sign up controller');
          expect(signupController.firstName, isA<String>());
          expect(signupController.lastName, isA<String>());
          expect(signupController.userName, isA<String>());
          expect(signupController.emailId, isA<String>());
          expect(signupController.password, isA<String>());
          // expect(signupController.confirmPassword, isA<String>());
          expect(signupController.phoneNumber, isA<String>());
          expect(signupController.firstNameError, isA<String?>());
          expect(signupController.lastNameError, isA<String?>());
          expect(signupController.emailErrorText, isA<String?>());
          expect(signupController.passwordErrors, isA<String?>());
          // expect(signupController.confirmPasswordError, isA<String?>());
          expect(signupController.isEmailValid, isA<bool>());
          expect(signupController.isTermsAndPolicyAccept, false);

          var validEmail = 'appscrip@gmail.com';
          var invalidEmail = 'appscrip@gmail';
          signupController.checkIfEmailIsValid(invalidEmail);
          expect(signupController.isEmailValid, false);
          expect(signupController.emailErrorText,
              StringConstants.pleaseEnterValidEmail);
          signupController.checkIfEmailIsValid(validEmail);
          expect(signupController.isEmailValid, true);
          expect(signupController.emailErrorText, null);

          var firstName = 'Appscrip';
          signupController.enterFirstName(firstName);
          expect(signupController.firstNameError, null);

          var lastName = 'Appscrip';
          signupController.enterLastName(lastName);
          expect(signupController.lastNameError, null);

          var userName = 'Appscrip';
          signupController.enterUserName(userName);
          expect(signupController.userNameError, null);

          var validPassword = 'Appscrip@1';
          var invalidPassword = 'appscrip@1';
          signupController.checkIfPasswordIsValid(invalidPassword);
          expect(signupController.passwordErrors,
              StringConstants.shouldHaveOneUppercaseLetter);
          expect(signupController.isPasswordValid, false);
          signupController.checkIfPasswordIsValid(validPassword);
          expect(signupController.passwordErrors, null);
          expect(signupController.isPasswordValid, true);

          // var validConfirmPassword = validPassword;
          // var invalidConfirmPassword = 'appscrip';
          // signupController.checkPasswordConfirmation(invalidConfirmPassword);
          // expect(signupController.confirmPasswordError,
          //     StringConstants.passwordAndConfirmPasswordShouldBeSame);
          // expect(signupController.isConfirmedPassword, false);
          // signupController.checkPasswordConfirmation(validConfirmPassword);
          // expect(signupController.confirmPasswordError, null);
          // expect(signupController.isConfirmedPassword, true);

          expect(signupController.isTermsAndPolicyAccept, false);

          expect(signupController.isSubmitButtonEnable, false);

          signupController.termsAndPolicy();
          expect(signupController.isTermsAndPolicyAccept, true);
          expect(signupController.isSubmitButtonEnable, true);

          expect(signupController.isPasswordVisible, false);
          signupController.passwordVisibility();
          expect(signupController.isPasswordVisible, true);
        },
      );
    },
  );
}
