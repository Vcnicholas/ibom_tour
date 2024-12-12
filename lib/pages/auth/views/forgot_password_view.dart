import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_widgets/app_filled_btn.dart';
import 'package:ibom_tour/app_widgets/app_text_btn.dart';
import 'package:ibom_tour/constants/dimens.dart';
import 'package:ibom_tour/constants/strings.dart';
import 'package:ibom_tour/constants/styles.dart';
import 'package:ibom_tour/pages/auth/controllers/password_controller.dart';
import 'package:ibom_tour/routes/routes_management.dart';

import '../../../app_widgets/custom_appbar.dart';
import '../../../app_widgets/unfocus_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  Widget _buildBody(BuildContext context) => GetBuilder<PasswordController>(
        builder: (logic) => Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsetsHorizDefault,
              child: FocusScope(
                node: logic.focusNode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Dimens.boxHeight32,
                    Text(
                      StringValues.forgotPassword,
                      style: AppStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                    Dimens.boxHeight8,
                    Text(
                      StringValues.forgotPasswordHelp,
                      style: AppStyles.p,
                      textAlign: TextAlign.center,
                    ),
                    Dimens.boxHeight32,
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: StringValues.enterEmail,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      style: AppStyles.style14Normal.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      controller: logic.emailTextController,
                      onEditingComplete: logic.focusNode.unfocus,
                    ),
                    Dimens.boxHeight32,
                    BxTextButton(
                      label: StringValues.loginToAccount,
                      onTap: () {
                        RouteManagement.goToBack();
                        RouteManagement.goToLoginView();
                      },
                    ),
                    Dimens.boxHeight32,
                    BxFilledButton(
                     // onTap: () => logic.sendResetPasswordOTP(),
                     onTap: (){},
                      label: StringValues.sendOtp,
                    ),
                    Dimens.boxHeight32,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringValues.alreadyHaveOtp,
                          style: AppStyles.style14Normal,
                        ),
                        Dimens.boxWidth4,
                        BxTextButton(
                          label: StringValues.resetPassword,
                          onTap: () {
                            RouteManagement.goToBack();
                            RouteManagement.goToResetPasswordView();
                          },
                        ),
                      ],
                    ),
                    Dimens.boxHeight16,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BxAppBar(),
                _buildBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}