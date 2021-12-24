import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A controller for [SubscriptionInformationView] to update the UI.
class SubscriptionInformationController extends GetxController {
  SubscriptionInformationController(this.subscriptionInformationPresenter);
  final SubscriptionInformationPresenter subscriptionInformationPresenter;
}
