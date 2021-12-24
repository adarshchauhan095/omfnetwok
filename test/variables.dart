import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import 'package:omf_netflix/domain/domain.dart';

abstract class Variables {
  static final layerBinding = BindingsBuilder<dynamic>(
    () {
      Get
        ..lazyPut(
          () => CommonService(),
        )
        ..lazyPut(
          () => ConnectHelper(),
        )
        ..lazyPut(
          () => DataRepository(
            Get.put(
              ConnectHelper(),
              permanent: true,
            ),
          ),
        )
        ..lazyPut(
          () => DeviceRepository(),
        )
        ..lazyPut(
          () => Repository(
            Get.find(),
            Get.find(),
          ),
        );
    },
  );

    /// Initialized Storage
  static Future initialzedStorage() async {
    await DeviceRepository().init(
      isTest: true,
    );
  }

  static final splashBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => SplashController(Get.put(SplashPresenter())),
      );
    },
  );

  static final signUpController = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => SignupController(Get.put(SignupPresenter())),
      );
    },
  );

  static final loginBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => LoginController(Get.put(LoginPresenter())),
      );
    },
  );

  static final loginOtpBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => LoginOtpController(Get.put(LoginOtpPresenter())),
      );
    },
  );

  static final homeBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => HomeController(Get.put(HomePresenter())),
      );
    },
  );

  static final forgotPasswordBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => ForgotPasswordController(Get.put(ForgotPasswordPresenter())),
      );
    },
  );

  static final mylistBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => MyListController(Get.put(MyListPresenter())),
      );
    },
  );

  static final subscriptionBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => SubscriptionController(Get.put(SubscriptionPresenter())),
      );
    },
  );

  static final accountBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => AccountController(Get.put(AccountPresenter())),
      );
    },
  );

  static final appsettingsBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => AppSettingsController(Get.put(AppSettingsPresenter())),
      );
    },
  );

  static final changePasswordBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => ChangePasswordController(Get.put(ChangePasswordPresenter())),
      );
    },
  );

  static final commentBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => CommentController(Get.put(CommentPresenter())),
      );
    },
  );

  static final productsBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => ProductsController(Get.put(ProductsPresenter())),
      );
    },
  );

  static final subscriptionInformationBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => SubscriptionInformationController(
            Get.put(SubscriptionInformationPresenter())),
      );
    },
  );

  static final lobbyBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => LobbyController(Get.put(LobbyPresenter())),
      );
    },
  );

  /// Get the material app wrapper for the widget
  static Material getTheMaterialAppWrapper(
    Widget widget,
  ) =>
      Material(
        child: ScreenUtilInit(
          designSize: const Size(375, 745),
          builder: () => GetMaterialApp(
            home: widget,
          ),
        ),
      );
}
