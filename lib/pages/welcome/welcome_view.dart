import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibom_tour/app_widgets/app_button.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/constants/dimens.dart';
import 'package:ibom_tour/constants/strings.dart';
import 'package:ibom_tour/constants/styles.dart';
import 'package:ibom_tour/routes/routes_management.dart';

import '../../app_widgets/app_texts.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  Widget _buildBodyPart2(BuildContext context) {
    return SizedBox(
      width: Dimens.screenWidth,
      height: (Dimens.screenHeight * 0.4),
      child: Padding(
        padding: AppStyles.defaultHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Dimens.boxHeight12,
                AppText(
                  StringValues.createRemitAcc,
                  align: TextAlign.center,
                  size: 30.sp, weight: FontWeight.w600,
                ),
                Dimens.boxHeight8,
                Text(
                  StringValues.onBoardingSubtitle,
                  style: AppStyles.p,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Dimens.boxHeight12,
            AppButton(
              width: Dimens.screenWidth,
              text: StringValues.register,
              onTap: RouteManagement.goToRegisterView,
            ),
            const AppButton(
              isTransparent: true,
              onTap: RouteManagement.goToLoginView,
              text: "Log In",
              textColor: ColorValues.primaryColor,
            ),
            Dimens.boxHeight16,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: ColorValues.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SizedBox(
          width: Dimens.screenWidth,
          height: Dimens.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBodyPart2(context),
            ],
          ),
        ),
      ),
    );
  }
}
