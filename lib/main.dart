import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ibom_tour/constants/hive_box_name.dart';
import 'package:ibom_tour/pages/auth/controllers/login_controller.dart';
import 'package:ibom_tour/pages/dashboard/dashboard_vm.dart';
import 'package:ibom_tour/pages/dashboard/home/controllers/home_controller.dart';
import 'package:ibom_tour/pages/onboarding/onboarding_controller.dart';
import 'package:ibom_tour/utils/app_utility.dart';

import 'app_services/app_theme_service.dart';
import 'app_services/route_service.dart';
import 'constants/enums.dart';
import 'constants/strings.dart';
import 'pages/auth/controllers/kyc_controller.dart';
import 'pages/auth/controllers/register_controller.dart';
import 'pages/dashboard/home/views/profile/controllers/profiile_controller.dart';
import 'routes/app_pages.dart';
import 'translation/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initializeFirebaseService();
  await _initPreAppServices();

  runApplication();
}

void runApplication() {
  AppUtility.log('Initializing App');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
  AppUtility.log('App Initialized');
}

Future<void> _initPreAppServices() async {
  AppUtility.log('Initializing PreApp Services');
  await Hive.initFlutter();

  AppUtility.log('Registering Hive Adapters');

  AppUtility.log('Hive Adapters Registered');

  AppUtility.log('Opening Hive Boxes');

  await Hive.openBox<String>(HiveBoxNames.themeMode);

  // Initialized Gex Services
  AppUtility.log('Initializing Get Services');
  Get.put(AppThemeController(), permanent: true);
  Get.put(OnBoardingController(), permanent: true);
  Get.put(RegisterController(), permanent: true);
  Get.put(LoginController(), permanent: true);
  Get.put(KycController(), permanent: true);
  Get.put(BottomNavViewModel(), permanent: true);
  Get.put(HomeController(), permanent: true);
  Get.put(ProfileController(), permanent: true);
  AppUtility.log('Get Services Initialized');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String _handleAppInitialRoute() {
    switch (RouteService.routeStatus) {
      case RouteStatus.init:
      case RouteStatus.notLoggedIn:
        return AppRoutes.onBoarding;
      case RouteStatus.error:
        return AppRoutes.error;
      case RouteStatus.noNetwork:
        return AppRoutes.noNetwork;
      case RouteStatus.serverOffline:
        return AppRoutes.offline;
      case RouteStatus.serverMaintenance:
        return AppRoutes.maintenance;
      case RouteStatus.loggedIn:
        return AppRoutes.home;
      default:
        return AppRoutes.onBoarding;
    }
  }

  ThemeMode _handleAppTheme(String mode) {
    if (mode == kDarkMode) {
      return ThemeMode.dark;
    }
    if (mode == kLightMode) {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeController>(
      builder: (logic) => ScreenUtilInit(
        designSize: const Size(392, 744),
        builder: (ctx, child) => GetMaterialApp(
          title: StringValues.appName,
          debugShowCheckedModeBanner: false,
          themeMode: _handleAppTheme(logic.themeMode),
          theme: logic.getLightThemeData(),
          darkTheme: logic.getDarkThemeData(),
          getPages: AppPages.pages,
          initialRoute: _handleAppInitialRoute(),
          //home: const OnBoardingView(),
          translations: AppTranslation(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'NG'),
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
