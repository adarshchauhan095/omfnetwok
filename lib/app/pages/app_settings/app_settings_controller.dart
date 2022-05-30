import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An [AppSettingsController], to update the UI for [AppSettingsView]
class AppSettingsController extends GetxController {
  AppSettingsController(this._appSettingsPresenter);
  final AppSettingsPresenter _appSettingsPresenter;

  /// List of attechments
  List<String> attachments = [];

  /// add images in attachements
  void addImageToAttachments(String image) {
    attachments.add(image);
    debugPrint('Attechments: $attachments');
    enableSubmitButton();
  }

  /// problem text
  var problemText = TextEditingController();

  /// problem text error string
  String? problemTextError;

  /// method to check problmtext entered or not
  void enterProblemText(String value) async {
    if (value.isEmpty) {
      problemTextError = 'requiredField'.tr;
    } else if (value.length < 10) {
      problemTextError = 'shouldBeMoreThanTenCharacter'.tr;
    } else {
      problemTextError = null;
    }
    enableSubmitButton();
  }

  void enableSubmitButton() {
    if (problemTextError == null &&
        problemText.text.isNotEmpty &&
        attachments.isNotEmpty) {
      isSubmitButtonEnable = true;
    } else {
      isSubmitButtonEnable = false;
    }
    update();
  }

  /// true if submit button is enable
  bool isSubmitButtonEnable = false;

  /// Report a Problem
  Future<void> reportAProblem() async {
    var response = await _appSettingsPresenter.reportAProblem(
        loading: true, problemText: problemText.text, attachments: attachments);
    if (!response.hasError) {
      Get.snackbar<void>('Message', 'Report Submitted',
          colorText: ColorsValue.whiteColor,
          backgroundColor: ColorsValue.greenColor);
      problemText.clear();
      isSubmitButtonEnable = false;
      attachments.clear();
      update();
    }
  }
}
