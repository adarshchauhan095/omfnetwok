import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// mylist test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing mylist module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.mylistBinding.builder();

      expect(Get.isPrepared<MyListController>(), true);

      Utility.printILog('Testing mylist controller');
      var mylistController = Get.find<MyListController>();
      mylistController.toString();

      expect(find.byKey(MyListView.myListViewKey), findsNothing);
      expect(find.byKey(MyListWidget.myListWidgetKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(const MyListView()),
      );

      expect(find.byKey(MyListView.myListViewKey), findsOneWidget);
      expect(find.byKey(MyListWidget.myListWidgetKey), findsOneWidget);
    },
  );
}
