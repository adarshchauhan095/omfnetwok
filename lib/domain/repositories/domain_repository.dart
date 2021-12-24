// coverage:ignore-file

/// Abstract classes that define functionality for data and device layers.
///
/// Will be ignored for test since all are static values and would not change.
abstract class DomainRepository {
  /// Get the string value for the [key].
  /// [key] : The key whose value is needed.
  String getStringValue(dynamic key);

  /// Save the value to the string.
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value);

  /// Clear data from local storage for [key].
  void clearData(dynamic key);

  /// Get the boolean value for the [key].
  /// [key] : The key whose value is needed.
  bool getBoolValue(dynamic key);

  /// Get the int value for the [key].
  /// [key] : The key whose value is needed.
  int getIntValue(String key);

  /// To Delete all the Values Stored in Device
  void deleteBox();

  /// Save the value to the list.
  /// [key] : The key to which value will be saved.
  /// value : The value which needs to be saved.
  dynamic getStoredValue(String key);

  /// To Delete all stored values
  void deleteAllFromSecureStorage();

  /// Clear data from Secure Storage for [key].
  void deleteFromSecureStorage(String key);

  /// Save the value to the list.
  /// [key] : The key to which value will be saved.
  /// [value] : The value which needs to be saved.
  void saveToSecureStorage(String key, String value);

  /// Get the Future string value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getValueFromSecureStorage(String key);
}
