// coverage:ignore-file
import 'package:omf_netflix/domain/domain.dart';

class ChangePasswordPresenter {
  ChangePasswordPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  /// Change password
  Future<ResponseModel> changePassword(
          {required bool loading,
          required String currentPassword,
          required String newPassword}) async =>
      await _authUseCases.changePassword(
          loading: loading,
          currentPassword: currentPassword,
          newPassword: newPassword);
}
