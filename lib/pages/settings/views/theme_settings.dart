import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_services/app_theme_service.dart';
import 'package:ibom_tour/app_widgets/custom_appbar.dart';
import 'package:ibom_tour/app_widgets/custom_radio_btn.dart';
import 'package:ibom_tour/constants/dimens.dart';
import 'package:ibom_tour/constants/strings.dart';
import 'package:ibom_tour/constants/styles.dart';
import 'package:ibom_tour/extensions/string_extensions.dart';

const String kSystemMode = 'system';
const String kLightMode = 'light';
const String kDarkMode = 'dark';

class ThemeSettingsView extends StatelessWidget {
  const ThemeSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Dimens.screenWidth,
          height: Dimens.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BxAppBar(
                title: StringValues.theme,
                padding: Dimens.edgeInsetsDefault,
              ),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: Dimens.edgeInsetsHorizDefault,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: GetBuilder<AppThemeController>(
            builder: (logic) => Column(
              children: [
                Dimens.boxHeight8,

                /// System
                BxRadioTile(
                  padding: Dimens.edgeInsets12,
                  showBorder: true,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  onTap: () => logic.setThemeMode(kSystemMode),
                  onChanged: (value) {
                    logic.setThemeMode(value);
                  },
                  title: Text(
                    StringValues.systemDefault.toTitleCase(),
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.systemDefaultDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  value: kSystemMode,
                  groupValue: logic.themeMode,
                ),

                Dimens.boxHeight8,

                /// Light
                BxRadioTile(
                  padding: Dimens.edgeInsets12,
                  showBorder: true,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  onTap: () => logic.setThemeMode(kLightMode),
                  onChanged: (value) {
                    logic.setThemeMode(value);
                  },
                  title: Text(
                    StringValues.light.toTitleCase(),
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.lightModeDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  value: kLightMode,
                  groupValue: logic.themeMode,
                ),

                Dimens.boxHeight8,

                /// Dark
                BxRadioTile(
                  padding: Dimens.edgeInsets12,
                  showBorder: true,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  onTap: () => logic.setThemeMode(kDarkMode),
                  onChanged: (value) {
                    logic.setThemeMode(value);
                  },
                  title: Text(
                    StringValues.dark.toTitleCase(),
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.darkModeDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  value: kDarkMode,
                  groupValue: logic.themeMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
