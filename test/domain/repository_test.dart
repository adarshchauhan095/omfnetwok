import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import 'package:omf_netflix/domain/domain.dart';
import '../variables.dart';

void main() {
  Get.testMode = true;
  CommonService? commonService;
  commonService.toString();
  Variables.layerBinding.builder();
  Variables.initialzedStorage();

  final repo = Get.find<Repository>();

  test('Repositories test', () async {
    var dataRepo = Get.find<DataRepository>();

    dataRepo.toString();

    expect(
      repo
          .getBoolValue(
            DeviceConstants.localLang,
          )
          .runtimeType,
      bool,
    );

    expect(
      repo
          .getIntValue(
            DeviceConstants.localLang,
          )
          .runtimeType,
      int,
    );

    expect(
      repo.getStringValue(DeviceConstants.localLang).runtimeType,
      String,
    );

    expect(repo.deleteBox, isA<void>());

    expect(() => repo.clearData(DeviceConstants.localLang), isA<void>());

    expect(() => repo.getValueFromSecureStorage(DeviceConstants.localLang),
        isA<void>());

    expect(() => repo.deleteAllFromSecureStorage, isA<void>());

    expect(() => repo.deleteFromSecureStorage(DeviceConstants.localLang),
        isA<void>());

    expect(
        () => repo.saveToSecureStorage(
            DeviceConstants.localLang, DeviceConstants.localLang),
        isA<void>());
  });
}
