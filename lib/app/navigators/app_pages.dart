// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(milliseconds: 350);

  static const initial = Routes.splash;
  static final pages = [
    GetPage<SplashView>(
      name: _Paths.splash,
      transitionDuration: transitionDuration,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<LoginView>(
      name: _Paths.logIn,
      transitionDuration: transitionDuration,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SignupView>(
      name: _Paths.signup,
      transitionDuration: transitionDuration,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<LoginOtpView>(
      name: _Paths.loginOtp,
      transitionDuration: transitionDuration,
      page: () => LoginOtpView(),
      binding: LoginOtpBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<HomeView>(
      name: _Paths.home,
      transitionDuration: transitionDuration,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<ForgotPasswordView>(
      name: _Paths.forgotPassword,
      transitionDuration: transitionDuration,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<MyListView>(
      name: _Paths.myList,
      transitionDuration: transitionDuration,
      page: () => const MyListView(),
      binding: MyListBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<AppSettingsView>(
      name: _Paths.appSettings,
      transitionDuration: transitionDuration,
      page: () => AppSettingsView(),
      binding: AppSettingsBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<AccountView>(
      name: _Paths.account,
      transitionDuration: transitionDuration,
      page: () => AccountView(),
      binding: AccountBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<SubscriptionView>(
      name: _Paths.subscription,
      transitionDuration: transitionDuration,
      page: () => SubscriptionView(),
      binding: SubscriptionBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<CommentView>(
      name: _Paths.comment,
      transitionDuration: transitionDuration,
      page: () => CommentView(),
      binding: CommentBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<ChangePasswordView>(
      name: _Paths.changePassword,
      transitionDuration: transitionDuration,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<ProductsView>(
      name: _Paths.products,
      transitionDuration: transitionDuration,
      page: () => ProductsView(),
      binding: ProductsBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<SubscriptionInformationView>(
      name: _Paths.subscriptionInformation,
      transitionDuration: transitionDuration,
      page: () => SubscriptionInformationView(),
      binding: SubscriptionInformationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<LobbyView>(
      name: _Paths.lobby,
      transitionDuration: transitionDuration,
      page: () => LobbyView(),
      binding: LobbyBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
