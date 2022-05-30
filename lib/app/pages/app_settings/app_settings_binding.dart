// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A list of bindings which will be used in the route of [AppSettingsBinding].
class AppSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AppSettingsController(
        Get.put(
          AppSettingsPresenter(
            Get.put(
              AuthUseCases(
                Get.find(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
