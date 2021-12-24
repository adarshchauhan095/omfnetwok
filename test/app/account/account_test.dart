import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// account test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing Account module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.accountBinding.builder();

      expect(Get.isPrepared<AccountController>(), true);

      Utility.printILog('Testing account controller');
      var accountController = Get.find<AccountController>();
      accountController.toString();

      expect(accountController.isPhoneNumberValid, equals(false));
      expect(accountController.phoneNumberError, equals(null));

      accountController
        ..storePhoneNumberCheck(false)
        ..checkIfPhoneNumberValid('12345');

      expect(accountController.isPhoneNumberValid, equals(false));
      expect(accountController.phoneNumberError,
          equals(StringConstants.enterAValidNumber));

      accountController
        ..storePhoneNumberCheck(true)
        ..checkIfPhoneNumberValid('701502787');

      expect(accountController.isPhoneNumberValid, equals(true));
      expect(accountController.phoneNumberError, equals(null));

      expect(find.byKey(AccountView.accountViewKey), findsNothing);
      expect(find.byKey(AccountWidget.accountWidgetKey), findsNothing);

      expect(accountController.imageFile, equals(null));

      accountController.pickImage(ImageSource.gallery);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(AccountView()),
      );

      // expect(find.byKey(AccountView.accountViewKey), findsOneWidget);
      // expect(find.byKey(AccountWidget.accountWidgetKey), findsOneWidget);
    },
  );
}
