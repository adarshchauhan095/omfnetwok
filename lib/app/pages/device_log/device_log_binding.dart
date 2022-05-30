import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/usecases/auth_usecases.dart';

class DeviceLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DeviceLogController(
        Get.put(
          DeviceLogPresenter(
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
