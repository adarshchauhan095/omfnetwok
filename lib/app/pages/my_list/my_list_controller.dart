import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A controller for [MyListView] to update the UI.
class MyListController extends GetxController {
  MyListController(this.myListPresenter);
  final MyListPresenter myListPresenter;
}
