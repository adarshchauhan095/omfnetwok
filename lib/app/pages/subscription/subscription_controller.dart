import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A controller for [SubscriptionView] to update the UI.
class SubscriptionController extends GetxController {
  SubscriptionController(this.subscriptionPresenter);
  final SubscriptionPresenter subscriptionPresenter;
}
