// coverage:ignore-file
import 'package:omf_netflix/domain/domain.dart';

class SplashPresenter {
  SplashPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  /// Get guesttoken from localstorage
  Future<String?> getSecureValue(String key) async =>
      await _authUseCases.getSecureValue(key);

  /// Get stored value form local
  dynamic getStoredValue(String key) => _authUseCases.getStoredValue(key);
}
