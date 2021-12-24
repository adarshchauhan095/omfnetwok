import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import '../variables.dart';

void main() {
  Get.testMode = true;

  test(
    'Data repository test cases',
    () async {
      expect(Get.isPrepared<DataRepository>(), false);
      Variables.layerBinding.builder();
      expect(Get.isPrepared<DataRepository>(), true);

      var repository = Get.find<DataRepository>();

      expect(
        () => repository.clearData(DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.getStringValue(DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.getIntValue(DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.getBoolValue(DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.saveValue(
          DeviceConstants.localLang,
          DataConstants.defaultLang,
        ),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.deleteBox(),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.getStoredValue(DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.deleteAllFromSecureStorage(),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.deleteFromSecureStorage(DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.saveToSecureStorage(
            DeviceConstants.localLang, DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );

      expect(
        () => repository.getValueFromSecureStorage(DeviceConstants.localLang),
        throwsA(
          isA<UnimplementedError>(),
        ),
      );
    },
  );
}
