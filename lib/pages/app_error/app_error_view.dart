import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/dimens.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../../utils/app_utility.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    var errorMessage = Get.arguments as String? ?? 'An error occurred';
    var lastExitTime = DateTime.now();
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (DateTime.now().difference(lastExitTime) >=
            const Duration(seconds: 2)) {
          AppUtility.showSnackBar(
            'Press the back button again to exit the app',
            '',
            duration: 2,
          );
          lastExitTime = DateTime.now();

          return;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            padding: Dimens.edgeInsetsDefault,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.screenWidth * 0.75,
                  height: Dimens.screenWidth * 0.75,
                ),
                Dimens.boxHeight16,
                Text(
                  errorMessage,
                  style: AppStyles.style20Bold,
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight8,
                Text(
                  StringValues.pleaseTryAgainLater,
                  style: AppStyles.style13Normal,
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
