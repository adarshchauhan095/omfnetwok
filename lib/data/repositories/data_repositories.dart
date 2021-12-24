import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);
  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  @override
  String getStringValue(dynamic key) {
    throw UnimplementedError();
  }

  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  @override
  bool getBoolValue(dynamic key) {
    throw UnimplementedError();
  }

  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  @override
  int getIntValue(dynamic key) {
    throw UnimplementedError();
  }

  @override
  dynamic getStoredValue(dynamic key) {
    throw UnimplementedError();
  }

  @override
  void deleteAllFromSecureStorage() {
    throw UnimplementedError();
  }

  @override
  void deleteFromSecureStorage(String key) {
    throw UnimplementedError();
  }

  @override
  void saveToSecureStorage(String key, String value) {
    throw UnimplementedError();
  }

  @override
  Future<String> getValueFromSecureStorage(String key) {
    throw UnimplementedError();
  }
}
