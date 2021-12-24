import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Repositories that communicate with the platform e.g. GPS
class DeviceRepository extends DomainRepository {
  final _flutterSecureStorage = const FlutterSecureStorage();

  /// HIVE STORAGE
  /// Initialize hive
  ///
  /// [isTest] : If in test mode pass true to initialize Hive in test environment
  Future<void> init({bool isTest = false}) async {
    if (isTest) {
      Hive.init('HIVE_TEST');
      await Hive.openBox<dynamic>(StringConstants.appName);
    } else {
      await Hive.initFlutter();
      await Hive.openBox<dynamic>(StringConstants.appName);
    }
  }

  Box _getBox() => Hive.box<dynamic>(StringConstants.appName);

  @override
  void clearData(dynamic key) {
    _getBox().delete(key);
  }

  @override
  void deleteBox() {
    Hive.box(StringConstants.appName).clear();
  }

  @override
  String getStringValue(dynamic key) {
    var box = _getBox();
    var defaultValue = '';
    if (key == DeviceConstants.localLang) {
      defaultValue = DataConstants.defaultLang;
    }
    var value = box.get(key, defaultValue: defaultValue) as String;
    return value;
  }

  @override
  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }

  @override
  bool getBoolValue(dynamic key) =>
      _getBox().get(key, defaultValue: false) as bool;

  @override
  int getIntValue(dynamic key) {
    var box = _getBox();
    var defaultValue = 0;
    var value = box.get(key, defaultValue: defaultValue) as int;
    return value;
  }

  @override
  dynamic getStoredValue(dynamic key) {
    var box = _getBox();
    var value = box.get(key);
    return value;
  }

  /// FLUTTER SECURE STORAGE
  @override
  void deleteAllFromSecureStorage() async {
    await _flutterSecureStorage.deleteAll();
  }

  @override
  void deleteFromSecureStorage(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }

  @override
  void saveToSecureStorage(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future<String> getValueFromSecureStorage(String key) async {
    var value = await _flutterSecureStorage.read(key: key);
    if (value != null) {
      return value;
    } else {
      return StringConstants.appName;
    }
  }
}
