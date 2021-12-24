import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// products test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing products module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.productsBinding.builder();

      expect(Get.isPrepared<ProductsController>(), true);

      Utility.printILog('Testing products controller');
      var productsController = Get.find<ProductsController>();
      productsController.toString();

      expect(find.byKey(ProductsView.productsViewKey), findsNothing);
      expect(find.byKey(ProductsWidget.productsWidgetKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(ProductsView()),
      );

      expect(find.byKey(ProductsView.productsViewKey), findsOneWidget);
      expect(find.byKey(ProductsWidget.productsWidgetKey), findsOneWidget);

    },
  );
}
