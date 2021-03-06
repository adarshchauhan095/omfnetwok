// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A list of bindings which will be used in the route of [SignupView].
class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
        () => SignupController(
              Get.put(
                SignupPresenter(
                  Get.put(
                    AuthUseCases(
                      Get.find(),
                    ),
                  ),
                ),
              ),
            ),
        fenix: true);
  }
}
