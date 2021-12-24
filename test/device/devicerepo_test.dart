import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/device/device.dart';
import '../variables.dart';

void main() {
  Get.testMode = true;

  test(
    'Device repository test cases',
    () async {
      expect(Get.isPrepared<DeviceRepository>(), false);
      Variables.layerBinding.builder();
      expect(Get.isPrepared<DeviceRepository>(), true);

      var repository = Get.find<DeviceRepository>();

      await repository.init(isTest: true);

      expect(
          () => repository.saveValue(
              DeviceConstants.localLang, DeviceConstants.localLang),
          isA<void>());

      expect(() => repository.getStringValue(DeviceConstants.localLang),
          isA<void>());

      expect(
          () => repository.clearData(DeviceConstants.localLang), isA<void>());

      expect(() => repository.deleteBox(), isA<void>());

      expect(() => repository.deleteAllFromSecureStorage(), isA<void>());

      expect(
          () => repository.deleteFromSecureStorage(DeviceConstants.localLang),
          isA<void>());

      expect(() => repository.getBoolValue(DeviceConstants.localLang),
          isA<void>());

      expect(
          () => repository.getIntValue(DeviceConstants.localLang), isA<void>());

      expect(() => repository.getStoredValue(DeviceConstants.localLang),
          isA<void>());

      expect(
          () => repository.getValueFromSecureStorage(DeviceConstants.localLang),
          isA<void>());

      expect(
          () => repository.saveToSecureStorage(
              DeviceConstants.localLang, DeviceConstants.localLang),
          isA<void>());
    },
  );
}
