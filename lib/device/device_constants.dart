// coverage:ignore-file
import 'package:omf_netflix/device/repositories/device_repositories.dart';

/// A chunk of shared preference keys which will
/// be used by [DeviceRepository] to get/save the data locally.
///
/// Will be ignored for test since all are static values and would not change.
abstract class DeviceConstants {
  static const String localLang = 'localLang';
}
