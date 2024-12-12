part of 'app_pages.dart';

abstract class AppRoutes {
  static const error = _Routes.error;

  static const forgotPassword = _Routes.forgotPassword;

  static const home = _Routes.home;
  static const login = _Routes.login;

  static const maintenance = _Routes.maintenance;

  static const noNetwork = _Routes.noNetwork;
  static const offline = _Routes.offline;
  static const onBoarding = _Routes.onBoarding;

  static const register = _Routes.register;
  static const resetPassword = _Routes.resetPassword;
  static const splashView = _Routes.splashView;

  static const verifyEmail = _Routes.verifyEmail;

  static const verifyOtp = _Routes.verifyOtp;

  static const verifyPassword = _Routes.verifyPassword;
  static const welcome = _Routes.welcome;
  static const kyc = _Routes.kyc;
  static const kycSubmit = _Routes.kycSubmit;
  static const kycSubmitted = _Routes.kycSubmitted;
}

abstract class _Routes {
  static const error = '/error';

  static const forgotPassword = '/forgot_password';

  static const home = '/home';
  static const login = '/login';

  static const maintenance = '/maintenance';

  static const noNetwork = '/no_network';
  static const offline = '/offline';
  static const onBoarding = '/onBoarding';

  static const register = '/register';
  static const resetPassword = '/resetPassword';
  static const splashView = '/splashView';

  static const verifyEmail = '/verify_email';
  static const verifyOtp = '/verifyOtp';
  static const verifyPassword = '/verify_password';
  static const welcome = '/welcome';
  static const kyc = '/kyc';
  static const kycSubmit = '/kyc_submitted';
  static const kycSubmitted = '/kyc_submitted2';
}
