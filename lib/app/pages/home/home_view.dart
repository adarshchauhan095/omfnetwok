import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// The view part of the [HomeView], which will be used to
/// show the BottomNavigation Bar
class HomeView extends StatelessWidget {
  static const homeViewKey = Key('home-view-key');

  final loginController =
      Get.put(LoginController(Get.put(LoginPresenter())), permanent: true);
  final accountController =
      Get.put(AccountController(Get.put(AccountPresenter())), permanent: true);
  final changePasswordController = Get.put(
      ChangePasswordController(Get.put(ChangePasswordPresenter())),
      permanent: true);
  final verificationController = Get.put(
      LoginOtpController(Get.put(LoginOtpPresenter())),
      permanent: true);
  final signUpController =
      Get.put(SignupController(Get.put(SignupPresenter())), permanent: true);
  final lobbyController =
      Get.put(LobbyController(Get.put(LobbyPresenter())), permanent: true);
  final commentController =
      Get.put(CommentController(Get.put(CommentPresenter())), permanent: true);

  @override
  Widget build(BuildContext context) => SafeArea(
        key: homeViewKey,
        child: GetBuilder<HomeController>(
          builder: (_controller) => Scaffold(
            extendBody: true,
            backgroundColor: ColorsValue.scaffoldBackgroundColor,
            drawer: WebMob(
              web: ((Responsive.isWeb(context)) ||
                      Responsive.isTablet(context) ||
                      Responsive.isMobile(context))
                  ? const WebNavigationDrawer()
                  : Dimens.box0,
              android: Dimens.box0,
            ),
            body: WebMob(
              web: ((Responsive.isWeb(context)) ||
                      Responsive.isTablet(context) ||
                      Responsive.isMobile(context))
                  ? _controller.pages[_controller.pageIndex]
                  : Dimens.box0,
              android: IndexedStack(
                index: _controller.selectedIndex,
                children: [..._controller.pages],
              ),
            ),
            bottomNavigationBar: WebMob(
              web: ((Responsive.isWeb(context)) ||
                      Responsive.isTablet(context) ||
                      Responsive.isMobile(context))
                  ? Dimens.box0
                  : Dimens.box0,
              android: BottomNavBar(),
            ),
          ),
        ),
      );
}
