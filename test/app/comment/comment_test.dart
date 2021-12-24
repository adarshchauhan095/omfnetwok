import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import '../../variables.dart';

/// comment test cases
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  Get.addPages(AppPages.pages);

  testWidgets(
    'Testing comment module',
    (tester) async {
      Utility.printILog('Initial initialization starting.');
      Variables.commentBinding.builder();

      expect(Get.isPrepared<CommentController>(), true);

      Utility.printILog('Testing comment controller');
      var commentController = Get.find<CommentController>();
      commentController.toString();

      expect(find.byKey(CommentView.commentViewKey), findsNothing);
      expect(find.byKey(CommentWidget.commentWidgetKey), findsNothing);

      await tester.pumpWidget(
        Variables.getTheMaterialAppWrapper(CommentView()),
      );

      expect(find.byKey(CommentView.commentViewKey), findsOneWidget);
      expect(find.byKey(CommentWidget.commentWidgetKey), findsOneWidget);

      expect(commentController.isSend, equals(false));
      expect(commentController.commentText, equals(''));
      commentController.commentAndSend('The comment');
      expect(commentController.isSend, equals(true));
      expect(commentController.commentText, equals('The comment'));
    },
  );
}
