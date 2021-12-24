import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An [CommentController], to update the UI for [CommentView]
class CommentController extends GetxController {
  CommentController(this.commentPresenter);
  final CommentPresenter commentPresenter;

  /// Entered comment text
  String commentText = '';

  /// Send icon
  bool isSend = false;

  ///save comment and send icon enable
  void commentAndSend(String value) {
    commentText = value;
    if (value.isNotEmpty) {
      isSend = true;
    } else {
      isSend = false;
    }
    update();
  }
}
