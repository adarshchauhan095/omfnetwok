import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omf_netflix/app/app.dart';

/// An [AccountController], to update the UI for [AccountView]
class AccountController extends GetxController {
  AccountController(this.accountPresenter);
  final AccountPresenter accountPresenter;

  /// A variable that holdes the [phoneNumber]
  String phoneNumber = '';

  /// A variable that holdes the validated error for [phoneNumber]
  String? phoneNumberError;

  /// this is true if the [phoneNumberError] is null and [phoneNumber] is valid
  bool isPhoneNumberValid = false;

  /// method that check [phoneNumber] is valid or not
  void storePhoneNumberCheck(bool value) {
    isPhoneNumberValid = value;
    update();
  }

  /// method that stores the [phoneNumber] and gives validation error 
  void checkIfPhoneNumberValid(String value) {
    phoneNumber = value;
    if (isPhoneNumberValid) {
      phoneNumberError = null;
    } else {
      phoneNumberError = StringConstants.enterAValidNumber;
    }
    update();
  }

  /// An object for ImagePicker
  final ImagePicker picker = ImagePicker();

  /// A variable that stores the [File] from [picker] image/video
  File? imageFile;

  /// method that pick image via [ImageSource] argument may be Camera/Gallery
  void pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(
        source: source,
      );
      if (pickedFile!.path.isEmpty) {
      } else {
        imageFile = File(pickedFile.path.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    update();
  }
}
