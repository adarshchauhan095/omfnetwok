import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  /// Hive Storage
  /// Clear data from local storage for [key].
  void clearData(String key) {
    try {
      _deviceRepository.clearData(key);
    } catch (_) {
      _dataRepository.clearData(key);
    }
  }

  /// To DeleteAll data stored in device
  void deleteBox() {
    try {
      _deviceRepository.deleteBox();
    } catch (_) {
      _dataRepository.deleteBox();
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(dynamic key) {
    try {
      return _deviceRepository.getStringValue(key);
    } catch (_) {
      return _dataRepository.getStringValue(key);
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(dynamic key) {
    try {
      return _deviceRepository.getBoolValue(key);
    } catch (_) {
      return _dataRepository.getBoolValue(key);
    }
  }

  /// Get the int value for the [key].
  ///
  /// [key] : The key whose value is needed.
  int getIntValue(dynamic key) {
    try {
      return _deviceRepository.getIntValue(key);
    } catch (_) {
      return _dataRepository.getIntValue(key);
    }
  }

  /// To Delete all stored values
  void deleteAllFromSecureStorage() {
    try {
      _deviceRepository.deleteAllFromSecureStorage();
    } catch (_) {
      _dataRepository.deleteAllFromSecureStorage();
    }
  }

  /// Clear data from Secure Storage for [key].
  void deleteFromSecureStorage(String key) {
    try {
      _deviceRepository.deleteFromSecureStorage(key);
    } catch (_) {
      _dataRepository.deleteFromSecureStorage(key);
    }
  }

  /// Save the value to the list.
  /// [key] : The key to which value will be saved.
  /// [value] : The value which needs to be saved.
  void saveToSecureStorage(String key, String value) {
    try {
      _deviceRepository.saveToSecureStorage(key, value);
    } catch (_) {
      _dataRepository.saveToSecureStorage(key, value);
    }
  }

  /// Get the Future string value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getValueFromSecureStorage(String key) {
    try {
      return _deviceRepository.getValueFromSecureStorage(key);
    } catch (_) {
      return _dataRepository.getValueFromSecureStorage(key);
    }
  }
}
