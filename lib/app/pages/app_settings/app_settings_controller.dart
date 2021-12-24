import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An [AppSettingsController], to update the UI for [AppSettingsView]
class AppSettingsController extends GetxController {
  AppSettingsController(this.appSettingsPresenter);
  final AppSettingsPresenter appSettingsPresenter;
}
