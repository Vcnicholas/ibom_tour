import 'package:flutter/material.dart';
import 'package:ibom_tour/constants/dimens.dart';

import '../constants/colors.dart';

class BxCircularProgressIndicator extends StatelessWidget {
  const BxCircularProgressIndicator({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.value,
  });

  final double? size;
  final double? strokeWidth;
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? Dimens.sixTeen,
      height: size ?? Dimens.sixTeen,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? Dimens.three,
        color: color ?? ColorValues.primaryColor,
        value: value,
      ),
    );
  }
}