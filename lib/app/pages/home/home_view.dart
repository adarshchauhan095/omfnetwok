// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
// import 'package:omf_netflix/domain/domain.dart';

/// The view part of the [HomeView], which will be used to
/// show the BottomNavigation Bar
class HomeView extends StatelessWidget {
  static const homeViewKey = Key('home-view-key');

  // final loginController = Get.put(
  //     LoginController(
  //         Get.put(LoginPresenter(Get.put(AuthUseCases(Get.find()))))),
  //     permanent: true);
  // final forgotPasswordController = kIsWeb
  //     ? Get.put(
  //         ForgotPasswordController(
  //             Get.put(ForgotPasswordPresenter(AuthUseCases(Get.find())))),
  //         permanent: true)
  //     : null;
  // final accountController = Get.put(
  //     AccountController(Get.put(AccountPresenter(AuthUseCases(Get.find())))),
  //     permanent: true);
  // final changePasswordController = Get.put(
  //     ChangePasswordController(Get.put(ChangePasswordPresenter(Get.put(AuthUseCases(Get.find()))))),
  //     permanent: true);
  // final verificationController = kIsWeb
  //     ? Get.put(
  //         LoginOtpController(
  //             Get.put(LoginOtpPresenter(Get.put(AuthUseCases(Get.find()))))),
  //         permanent: true)
  //     : '';
  // final signUpController = Get.put(
  //     SignupController(
  //         Get.put(SignupPresenter(Get.put(AuthUseCases(Get.find()))))),
  //     permanent: true);
  // final lobbyController =
  //     Get.put(LobbyController(Get.put(LobbyPresenter())), permanent: true);
  // final commentController =
  //     Get.put(CommentController(Get.put(CommentPresenter())), permanent: true);

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
            floatingActionButton: _controller.selectedIndex == 4 &&
                    _controller.isFavoritePosts == 2
                ? FloatingActionButton(
                    onPressed: () {
                      _controller.addNewCollectionSheet();
                    },
                    backgroundColor: ColorsValue.primaryColor,
                    child: Icon(
                      Icons.add,
                      color: ColorsValue.whiteColor,
                      size: Dimens.fourty,
                    ),
                  )
                : null,
            body: WebMob(
              web: ((Responsive.isWeb(context)) ||
                      Responsive.isTablet(context) ||
                      Responsive.isMobile(context))
                  // ? _controller.pages[_controller.pageIndex]
                  ? Dimens.box0
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
