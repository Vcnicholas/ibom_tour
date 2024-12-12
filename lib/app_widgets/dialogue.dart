import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static void showAlertdialog(BuildContext context, Widget child) {
    showDialog(
        context: context,
        builder: (BuildContext context)
    {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        content: child,
      );
    });
}

void openAlert({required Widget child, required BuildContext context, }){
 showAlertdialog(context, Container(height:200 ,child: child,));
}}