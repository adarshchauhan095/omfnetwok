// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A list of bindings which will be used in the route of [LoginView].
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(
              Get.put(
                LoginPresenter(
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
