import 'package:get/get.dart';
import 'package:ibom_tour/pages/auth/binding/login_binding.dart';
import 'package:ibom_tour/pages/auth/views/login_view.dart';
import 'package:ibom_tour/pages/auth/views/register_view.dart';
import 'package:ibom_tour/pages/onboarding/onboarding_binding.dart';
import 'package:ibom_tour/pages/onboarding/onboarding_view.dart';
import 'package:ibom_tour/pages/welcome/welcome_view.dart';

import '../pages/app_error/app_error_view.dart';
import '../pages/no_network/no_network_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static var defaultTransition = Transition.circularReveal;
  static final pages = [
    GetPage(
      name: _Routes.error,
      page: AppErrorView.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
    GetPage(
      name: _Routes.noNetwork,
      page: NoNetworkView.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
    GetPage(
        name: _Routes.onBoarding,
        page: OnBoardingView.new,
        binding: OnBoardingBinding(),
        transitionDuration: transitionDuration,
        transition: defaultTransition),

    GetPage(
      name: _Routes.welcome,
      page: WelcomeView.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    /// ------------------------------------------------------------------//
    /// Auth Section ------------------------------//

    GetPage(
        name: _Routes.login,
        page: LoginView.new,
        transition: defaultTransition,
        transitionDuration: transitionDuration,
        binding: LoginBinding()),

    GetPage(
        name: _Routes.register,
        page: RegisterView.new,
        transition: defaultTransition,
        transitionDuration: transitionDuration),

    GetPage(
        name: _Routes.verifyOtp,
        page: RegisterView.new,
        transition: defaultTransition,
        transitionDuration: transitionDuration),

  ];

  static var transitionDuration = const Duration(milliseconds: 500);
}
