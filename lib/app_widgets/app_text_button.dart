import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/dimens.dart';
import '../constants/styles.dart';

class BxTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? labelStyle;
  final bool? enabled;
  final double? fontSize;
  final Color? textColor;

  const BxTextButton({
    super.key,
    required this.label,
    required this.onTap,
    this.padding,
    this.margin,
    this.labelStyle,
    this.enabled = true,
    this.fontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == true ? onTap : () {},
      child: Container(
        padding: padding,
        margin: margin,
        child: Text(
          label,
          style: labelStyle ??
              AppStyles.p.copyWith(
                color: enabled == false
                    ? Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withAlpha(50)
                    : textColor ?? ColorValues.primaryColor,
                fontSize: fontSize ?? Dimens.fourteen,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}