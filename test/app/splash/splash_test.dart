import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// Splash test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing Splash Screen',
    (tester) async {
      Utility.printILog('Initial initialization starting.');

      expect(Get.isPrepared<SplashController>(), false);
      Variables.splashBinding.builder();
      expect(Get.isPrepared<SplashController>(), true);

      Utility.printILog('Testing Splash controller');
 
      final splashView = find.byKey(
        const Key(
          SplashView.splashViewKey,
        ),
      );

      final splashImage = find.byKey(
        const Key(
          SplashWidget.splashImage,
        ),
      );
      expect(splashView, findsNothing);
      expect(splashImage, findsNothing);

      await tester.pumpWidget(
        GetMaterialApp(
          home: SplashView(),
        ),
      );
      await tester.pumpAndSettle(
        const Duration(
          seconds: 2,
        ),
      );
      
      // expect(splashView, findsOneWidget);
      // expect(splashImage, findsOneWidget);

           var splashController = Get.find<SplashController>();
      splashController.toString();
    },
  );
}
