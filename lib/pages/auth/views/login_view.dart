import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_widgets/app_filled_btn.dart';
import 'package:ibom_tour/app_widgets/custom_appbar.dart';
import 'package:ibom_tour/app_widgets/unfocus_widget.dart';
import 'package:ibom_tour/constants/dimens.dart';
import 'package:ibom_tour/constants/strings.dart';
import 'package:ibom_tour/constants/styles.dart';
import 'package:ibom_tour/pages/auth/controllers/login_controller.dart';

import '../../../app_widgets/app_text_btn.dart';
import '../../../routes/routes_management.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  Widget _buildLoginFields(BuildContext context) => GetBuilder<LoginController>(
        builder: (logic) => Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppStyles.defaultHorizontalPadding,
              child: FocusScope(
                node: logic.focusNode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Dimens.boxHeight32,
                    Text(
                      StringValues.welcomeBack,
                      style: AppStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                    Dimens.boxHeight8,
                    Text(
                      StringValues.loginToAccount,
                      style: AppStyles.p,
                      textAlign: TextAlign.center,
                    ),
                    Dimens.boxHeight32,
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: StringValues.emailOrUsername,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: AppStyles.style14Normal.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      controller: logic.emailUnameTextController,
                      onEditingComplete: logic.focusNode.nextFocus,
                    ),
                    Dimens.boxHeight16,
                    TextFormField(
                      obscureText: logic.showPassword,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: logic.toggleViewPassword,
                          child: Icon(
                            logic.showPassword
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                        ),
                        hintText: StringValues.password,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      style: AppStyles.style14Normal.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      controller: logic.passwordTextController,
                      onEditingComplete: logic.focusNode.unfocus,
                    ),
                    Dimens.heightedBox(Dimens.twentyEight),
                    const BxTextButton(
                      label: StringValues.forgotPassword,
                      onTap: RouteManagement.goToForgotPasswordView,
                    ),
                    Dimens.boxHeight32,
                    BxFilledButton(
                      //onTap: () => logic.login(),
                      onTap: () {},
                      label: StringValues.login,
                    ),
                    Dimens.boxHeight32,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringValues.doNotHaveAccount,
                          style: AppStyles.p,
                        ),
                        Dimens.boxWidth4,
                        BxTextButton(
                          label: StringValues.register,
                          onTap: () {
                            RouteManagement.goToBack();
                            RouteManagement.goToRegisterView();
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

  BxAppBar _buildAppBar(BuildContext context) {
    return const BxAppBar();
  }

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
                _buildAppBar(context),
                _buildLoginFields(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
