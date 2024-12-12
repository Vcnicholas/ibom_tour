//
// import 'package:flutter/material.dart';
// import 'package:ibom_tour/app_widgets/app_texts.dart';
// import 'package:ibom_tour/constants/colors.dart';
// import 'package:ibom_tour/constants/dimens.dart';
//
// class CustomPhoneNumberInput extends StatelessWidget {
//   final Function? onSubmit;
//   final String? hintText;
//   final double? textSize;
//   final Color? hintColor;
//   final String? Function(String?)? validator;
//   final Function(PhoneNumber)? onSaved;
//   final Function(PhoneNumber)? onInputChanged;
//   String? isoCode;
//   final String? hint;
//   final TextEditingController? controller;
//
//   CustomPhoneNumberInput(
//       {super.key,
//       this.onSubmit,
//       this.onSaved,
//       this.isoCode,
//       this.onInputChanged,
//       this.controller,
//       this.hint = "Phone Number",
//       this.hintText,
//       this.textSize,
//       this.hintColor,
//       this.validator});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         hintText != null
//             ? Column(
//                 children: [
//                   AppText(
//                     hintText ?? "",
//                     size: textSize ?? 13.5,
//                     color: hintColor ?? ColorValues.primaryColor,
//                     // isBold: true,
//                     align: TextAlign.start,
//                   ),
//                 Dimens.boxHeight10,
//                 ],
//               )
//             : Dimens.boxHeight0,
//         Column(
//           children: [
//             InternationalPhoneNumberInput(
//               onInputChanged: (PhoneNumber number) => onInputChanged!(number),
//               keyboardType: const TextInputType.numberWithOptions(
//                 signed: true,
//                 decimal: true,
//               ),
//               initialValue: PhoneNumber(
//                 isoCode:
//                     'NG', // Set the default country using its ISO code (e.g., 'US' for United States)
//               ),
//               searchBoxDecoration: InputDecoration(
//                 isDense: true,
//                 filled: true,
//                 fillColor: Colors.transparent,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: ColorValues.primaryColor, width: Dimens.pointEight),
//                     borderRadius: BorderRadius.circular(8)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         width: Dimens.pointEight,
//                         color:
//                             Theme.of(context).disabledColor.withOpacity(0.5)),
//                     borderRadius: BorderRadius.circular(8)),
//                 errorBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: ColorValues.warningColor, width: Dimens.pointEight),
//                     borderRadius: BorderRadius.circular(8)),
//                 errorStyle:
//                     const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                 focusedErrorBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.red),
//                 ),
//               ),
//               inputDecoration: InputDecoration(
//                 isDense: true,
//                 // border: InputBorder.none,
//                 hintText: hint!,
//                 filled: true,
//                 fillColor: Colors.transparent,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: ColorValues.primaryColor, width: Dimens.pointEight),
//                     borderRadius: BorderRadius.circular(8)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         width: 0.8,
//                         color:
//                             Theme.of(context).disabledColor.withOpacity(0.5)),
//                     borderRadius: BorderRadius.circular(8)),
//                 errorBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: ColorValues.warningColor, width: Dimens.pointEight),
//                     borderRadius: BorderRadius.circular(8)),
//                 errorStyle:
//                     const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                 focusedErrorBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.red),
//                 ),
//               ),
//               textFieldController: controller,
//               // initialValue: PhoneNumber(isoCode: isoCode!),
//               selectorConfig: const SelectorConfig(
//                 selectorType: PhoneInputSelectorType.DIALOG,
//               ),
//               ignoreBlank: true,
//               autoValidateMode: AutovalidateMode.disabled,
//               onSaved: (PhoneNumber number) => {onSaved!(number)},
//               onSubmit: () => onSubmit!(),
//               validator: validator,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }