import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/constants/dimens.dart';
import 'package:ibom_tour/constants/styles.dart';
import 'package:ibom_tour/routes/routes_management.dart';

class BxAppBar extends StatelessWidget {
  const BxAppBar({
    super.key,
    this.title,
    this.showDivider = false,
    this.child,
    this.showBackBtn = true,
    this.padding,
    this.titleStyle,
    this.bgColor,
    this.backBtnColor,
    this.trailingWidget,
  });

  final String? title;
  final TextStyle? titleStyle;
  final bool? showDivider;
  final Widget? child;
  final Color? backBtnColor;
  final bool? showBackBtn;
  final EdgeInsets? padding;
  final Color? bgColor;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.screenWidth,
      color: bgColor ?? ColorValues.transparent,
      child: Padding(
        padding: padding ?? AppStyles.defaultHorizontalPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showBackBtn == true)
              GestureDetector(
                onTap: RouteManagement.goToBack,
                child: Container(
                  padding: Dimens.edgeInsets12,
                  decoration: BoxDecoration(
                    color: ColorValues.primaryColor30,
                    borderRadius: AppStyles.defaultBorderRadius,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: backBtnColor ??
                        Theme.of(context).textTheme.bodyLarge!.color,
                    size: Dimens.twentyFour,
                  ),
                ),
              ),
            if (showBackBtn == true) Dimens.boxWidth12,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (child != null) child!,
                  if (child != null && title != null) Dimens.boxWidth16,
                  if (title != null && title!.isNotEmpty)
                    Text(
                      title!,
                      style: titleStyle ??
                          AppStyles.h4.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                    )
                ],
              ),
            ),
            if (trailingWidget != null) trailingWidget!,
          ],
        ),
      ),
    );
  }
}