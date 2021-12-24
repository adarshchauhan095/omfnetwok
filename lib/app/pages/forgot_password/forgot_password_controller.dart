import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An [ForgotPasswordController], to update the UI for [ForgotPasswordView]
class ForgotPasswordController extends GetxController {
  ForgotPasswordController(this.forgotPasswordPresenter);
  final ForgotPasswordPresenter forgotPasswordPresenter;
}
