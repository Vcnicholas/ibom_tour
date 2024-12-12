import 'package:flutter/material.dart';
import 'package:ibom_tour/app_widgets/app_texts.dart';
import 'package:ibom_tour/constants/assets.dart';
import 'package:ibom_tour/constants/dimens.dart';
import 'package:ibom_tour/utils/app_utility.dart';

import '../../constants/styles.dart';

class NoNetworkView extends StatelessWidget {
  const NoNetworkView({super.key});

  @override
  Widget build(BuildContext context) {
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
                AppText(
                  'No Network',
                  style: AppStyles.style20Bold,
                  align: TextAlign.center,
                ),
                Dimens.boxHeight8,
                Text(
                  'You are not connected to any network.',
                  style: AppStyles.style14Normal,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Please try again later.',
                  style: AppStyles.style14Normal,
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
