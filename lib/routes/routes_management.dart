import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToWelcomeView() {
    Get.offAllNamed(AppRoutes.welcome);
  }

  static void goToServerMaintenanceView() {
    Get.offAllNamed(AppRoutes.maintenance);
  }

  static void goToServerOfflineView() {
    Get.offAllNamed(AppRoutes.offline);
  }

  static void gotToErrorView() {
    Get.offAllNamed(AppRoutes.error);
  }

  static void goToNetworkErrorView() {
    Get.offAllNamed(AppRoutes.noNetwork);
  }

  //------------------------Auth Sections-----------------------------///
  static void goToSelectOption() {
    Get.toNamed(AppRoutes.welcome);
  }

  static void goToLoginView() {
    Get.toNamed(AppRoutes.login);
  }

  static void goToRegisterView() {
    Get.toNamed(AppRoutes.register);
  }

  static void goToForgotPasswordView() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  static void goToResetPasswordView() {
    Get.toNamed(AppRoutes.resetPassword);
  }

  static void goToKycView() {
    Get.toNamed(AppRoutes.kyc);
  }

  static void goToKycSubmit() {
    Get.toNamed(AppRoutes.kycSubmitted);
  }

  static void goToKycSubmitted() {
    Get.toNamed(AppRoutes.kycSubmitted);
  }

  /// --------------------------------------------------------------------------

  /// Go to back Page / Close Pages --------------------------------------------

  static void goToBack() {
    Get.back();
  }

  /// --------------------------------------------------------------------------
}
