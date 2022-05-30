// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A list of bindings which will be used in the route of [ChangePasswordBinding].
class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChangePasswordController(
        Get.put(
          ChangePasswordPresenter(
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
