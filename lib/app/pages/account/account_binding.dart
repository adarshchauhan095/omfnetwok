// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A list of bindings which will be used in the route of [AccountBinding].
class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => AccountController(
              Get.put(
                AccountPresenter(
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
