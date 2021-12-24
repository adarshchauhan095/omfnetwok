// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A list of bindings which will be used in the route of [AppSettingsBinding].
class AppSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AppSettingsController(
        Get.put(
          AppSettingsPresenter(),
        ),
      ),
    );
  }
}
