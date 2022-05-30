// coverage:ignore-file
import 'package:omf_netflix/domain/domain.dart';

/// connect to the controller to retrieve the data . 
class AppSettingsPresenter {
  AppSettingsPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

    /// Report a Problem
  Future<ResponseModel> reportAProblem(
      {required bool loading,
      required String problemText,
      required List<String> attachments}) async => await _authUseCases.reportAProblem(
        loading: loading, problemText: problemText, attachments: attachments);
    
  
}
