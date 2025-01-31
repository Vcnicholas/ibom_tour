import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/services/hive_service.dart';

import '../constants/colors.dart';
import '../constants/dimens.dart';
import '../constants/styles.dart';

const String kThemeModeBox = 'themeMode';
const String kThemeModeKey = 'themeMode';
const String kSystemMode = 'system';
const String kLightMode = 'light';
const String kDarkMode = 'dark';
const String kDefaultFontFamily = 'Poppins';

class AppThemeController extends GetxController {
  final _themeMode = kSystemMode.obs;

  @override
  void onInit() {
    super.onInit();
    getThemeMode();
  }

  static AppThemeController get find => Get.find();

  String get themeMode => _themeMode.value;

  void getSystemChromeData() {
    var themeBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

    if (themeMode == kLightMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: ColorValues.lightBgColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: ColorValues.lightBgColor,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else if (themeMode == kDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: ColorValues.darkBgColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: ColorValues.darkBgColor,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      if (themeBrightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: ColorValues.lightBgColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: ColorValues.lightBgColor,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: ColorValues.darkBgColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: ColorValues.darkBgColor,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
      }
    }
  }

  ThemeData getLightThemeData() {
    getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ColorValues.primaryColor,
      iconTheme: const IconThemeData(color: ColorValues.lightGrayColor),

      scaffoldBackgroundColor: ColorValues.lightBgColor,
      appBarTheme: const AppBarTheme(backgroundColor: ColorValues.lightBgColor),
      cardColor: ColorValues.lightDialogColor,
      shadowColor: ColorValues.shadowColor.withAlpha(12),
      cardTheme: const CardTheme(color: ColorValues.lightDialogColor),
      dialogTheme:
          const DialogTheme(backgroundColor: ColorValues.lightDialogColor),
      dialogBackgroundColor: ColorValues.lightDialogColor,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: ColorValues.lightDialogColor,
        surfaceTintColor: ColorValues.lightDialogColor,
        modalBackgroundColor: ColorValues.lightDialogColor,
        modalBarrierColor: ColorValues.blackColor.withOpacity(0.5),
      ),
      dividerColor: ColorValues.lightDividerColor,
      disabledColor: ColorValues.lightGrayColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorValues.darkBgColor,
        contentTextStyle: AppStyles.style14Normal.copyWith(
          color: ColorValues.darkBodyTextColor,
        ),
        actionTextColor: ColorValues.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: WidgetStateProperty.all(ColorValues.primaryColor),
          foregroundColor: WidgetStateProperty.all(ColorValues.whiteColor),
          elevation: WidgetStateProperty.all(0.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: ScreenUtil().screenWidth,
        ),
        labelStyle: AppStyles.p.copyWith(
          color: ColorValues.lightBodyTextColor,
        ),
        floatingLabelStyle: AppStyles.p.copyWith(
          color: ColorValues.lightBodyTextColor.withAlpha(140),
        ),
        hintStyle: AppStyles.p.copyWith(
          color: ColorValues.lightBodyTextColor.withAlpha(140),
        ),
        errorStyle: AppStyles.p.copyWith(
          color: ColorValues.errorColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.lightDividerColor,
            width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.lightDividerColor.withAlpha(20),
            width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.lightDividerColor,
           width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.primaryColor,
            width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
           width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
           width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
      ),
      fontFamily: kDefaultFontFamily,
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
          color: ColorValues.lightBodyTextColor,
        ),
        bodyMedium: const TextStyle(
          color: ColorValues.lightBodyTextColor,
        ),
        bodySmall: const TextStyle(
          color: ColorValues.lightBodyTextColor,
        ),
        titleMedium: TextStyle(
          color: ColorValues.lightBodyTextColor.withAlpha(180),
        ),
        titleSmall: TextStyle(
          color: ColorValues.lightBodyTextColor.withAlpha(140),
        ),
      ),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData getDarkThemeData() {
    getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ColorValues.primaryColor,
      iconTheme: const IconThemeData(color: ColorValues.darkGrayColor),
      scaffoldBackgroundColor: ColorValues.darkBgColor,
      shadowColor: ColorValues.shadowColor.withAlpha(12),
      appBarTheme: const AppBarTheme(backgroundColor: ColorValues.darkBgColor),
      cardColor: ColorValues.darkDialogColor,
      cardTheme: const CardTheme(color: ColorValues.darkDialogColor),
      dialogTheme:
          const DialogTheme(backgroundColor: ColorValues.darkDialogColor),
      dialogBackgroundColor: ColorValues.darkDialogColor,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: ColorValues.darkDialogColor,
        surfaceTintColor: ColorValues.darkDialogColor,
        modalBackgroundColor: ColorValues.darkDialogColor,
        modalBarrierColor: ColorValues.blackColor.withOpacity(0.5),
      ),
      dividerColor: ColorValues.darkDividerColor,
      disabledColor: ColorValues.darkGrayColor,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: ColorValues.lightBgColor,
        contentTextStyle: TextStyle(
          color: ColorValues.lightBodyTextColor,
        ),
        actionTextColor: ColorValues.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: WidgetStateProperty.all(ColorValues.primaryColor),
          foregroundColor: WidgetStateProperty.all(ColorValues.whiteColor),
          elevation: WidgetStateProperty.all(0.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        contentPadding: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: ScreenUtil().screenWidth,
        ),
        labelStyle: AppStyles.p.copyWith(
          color: ColorValues.darkBodyTextColor,
        ),
        floatingLabelStyle: AppStyles.p.copyWith(
          color: ColorValues.darkBodyTextColor.withAlpha(140),
        ),
        hintStyle: AppStyles.p.copyWith(
          color: ColorValues.darkBodyTextColor.withAlpha(140),
        ),
        errorStyle: AppStyles.p.copyWith(
          color: ColorValues.errorColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.darkDividerColor,
            width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.darkDividerColor,
            width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.darkDividerColor,
          width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.primaryColor,
           width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
            width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
           width: ScreenUtil().setWidth(Dimens.one),
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
      ),
      fontFamily: kDefaultFontFamily,
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
          color: ColorValues.darkBodyTextColor,
        ),
        bodyMedium: const TextStyle(
          color: ColorValues.darkBodyTextColor,
        ),
        bodySmall: const TextStyle(
          color: ColorValues.darkBodyTextColor,
        ),
        titleMedium: TextStyle(
          color: ColorValues.darkBodyTextColor.withAlpha(180),
        ),
        titleSmall: TextStyle(
          color: ColorValues.darkBodyTextColor.withAlpha(140),
        ),
      ),
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  void setThemeMode(String mode) async {
    _themeMode.value = mode;
    await HiveService.put<String>(kThemeModeBox, kThemeModeKey, mode);
    update();
  }

  void getThemeMode() async {
    var themeMode = await HiveService.get<String>(kThemeModeBox, kThemeModeKey);

    switch (themeMode) {
      case kSystemMode:
        _themeMode.value = kSystemMode;
        break;
      case kLightMode:
        _themeMode.value = kLightMode;
        break;
      case kDarkMode:
        _themeMode.value = kDarkMode;
        break;
      default:
        _themeMode.value = kSystemMode;
        break;
    }
    update();
  }
}