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
          CommonService.new,
        )
        ..lazyPut(
          ConnectHelper.new,
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
          DeviceRepository.new,
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
        () => SplashController(Get.put(SplashPresenter(AuthUseCases(Get.find())))),
      );
    },
  );

  static final signUpController = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => SignupController(Get.put(SignupPresenter(AuthUseCases(Get.find())))),
      );
    },
  );

  static final loginBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => LoginController(Get.put(LoginPresenter(AuthUseCases(Get.find())))),
      );
    },
  );

  static final loginOtpBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => LoginOtpController(Get.put(LoginOtpPresenter(Get.put(AuthUseCases(Get.find()))))),
      );
    },
  );

  static final homeBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => HomeController(Get.put(HomePresenter(Get.put(AuthUseCases(Get.find()))))),
      );
    },
  );

  static final forgotPasswordBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => ForgotPasswordController(Get.put(ForgotPasswordPresenter(AuthUseCases(Get.find())))),
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
        () => AccountController(Get.put(AccountPresenter(AuthUseCases(Get.find())))),
      );
    },
  );

  static final appsettingsBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => AppSettingsController(Get.put(AppSettingsPresenter(Get.put(AuthUseCases(Get.find()))))),
      );
    },
  );

  static final changePasswordBinding = BindingsBuilder<dynamic>(
    () {
      Get.lazyPut(
        () => ChangePasswordController(Get.put(ChangePasswordPresenter(Get.put(AuthUseCases(Get.find()))))),
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
