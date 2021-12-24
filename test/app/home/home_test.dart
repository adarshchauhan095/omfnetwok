import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// home test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing home module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
     
     
      Variables.homeBinding.builder();

      expect(Get.isPrepared<HomeController>(), true);

      Utility.printILog('Testing home controller');
      var homeController = Get.find<HomeController>();
      homeController.toString();

      expect(find.byKey(HomeView.homeViewKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(HomeView()),
      );

      expect(find.byKey(HomeView.homeViewKey), findsOneWidget);
    },
  );
}
