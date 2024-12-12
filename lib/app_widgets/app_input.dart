import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ibom_tour/constants/colors.dart';

import 'app_texts.dart';

class AppInputField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final String? Function(String? val)? onSaved;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String topLabel;
  final String? hintText;
  final FocusNode? focusnode;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final int? maxLines;
  final Color? color;
  final double? height;
  final bool? enabled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final Widget? topLabelRightItem;
  final TextStyle? labelStyle;
  final TextStyle? topLabelStyle;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const AppInputField({
    Key? key,
    this.autovalidateMode,
    this.style,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.onSaved,
    this.color,
    this.message,
    this.hintText,
    this.label = '',
    this.topLabel = '',
    this.formError,
    this.focusnode,
    this.textInputAction,
    this.controller,
    this.clearForm,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.validator,
    this.hintColor,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.topLabelRightItem,
    this.labelStyle,
    this.topLabelStyle,
    this.initialValue,
    this.floatingLabelBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = style?.fontSize == null
        ? 14 / MediaQuery.textScaleFactorOf(context)
        : style!.fontSize! / MediaQuery.textScaleFactorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (topLabel != "")
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    topLabel,
                    weight: FontWeight.w500,
                    size: 15.sp,
                  ),
                  if (topLabelRightItem != null) labelRightItem!
                ],
              ),
              Gap(8.sp)
            ],
          ),
        TextFormField(
          keyboardType: keyBoardType,
          obscureText: obscureText ?? false,
          validator: validator,
          readOnly: readOnly,
          enabled: enabled,
          autovalidateMode: autovalidateMode,
          textInputAction: TextInputAction.next,
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEdittingComplete,
          maxLines: maxLines ?? 1,
          cursorColor: ColorValues.grayColor,
          decoration: InputDecoration(
            fillColor: ColorValues.darkGrayColor.withOpacity(.1),
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide(color: ColorValues.errorColor)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),

            contentPadding:
                EdgeInsets.only(bottom: 15.sp, left: 10, right: 10, top: 5),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            label: AppText(
              label,
            ),
            hintStyle: TextStyle().copyWith(fontSize: fontSize),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),

           
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: color ?? ColorValues.darkGrayColor.withOpacity(.1),
                width: .1,
              ),
            ),

         
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: color ?? ColorValues.errorColor,
                width: .1,
              ),
            ),
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.auto,
          ),
        ),
      ],
    );
  }
}
