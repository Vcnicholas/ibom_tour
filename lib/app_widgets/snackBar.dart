import 'dart:async'; // Import the Timer package
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibom_tour/constants/colors.dart';

import 'app_texts.dart';

class SnackBar {
  final bool success;
  final String message;
  final OverlayEntry _overlayEntry;
  Timer? _timer; // Declare a Timer

  SnackBar({required this.success, required BuildContext context, required this.message})
      : _overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 70.0,
      left: 16.0,
      right: 16.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: success ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Row(
              children: [
                Icon(
                  success ? Icons.check_circle : Icons.warning_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: AppText(
                    message,
                    color: ColorValues.whiteColor,
                    size: 14.sp,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    SnackBar.hide();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  void show(BuildContext context) {
    Overlay.of(context)!.insert(_overlayEntry);

    // Start a timer to auto-close the snackbar after 4 seconds
    _timer = Timer(Duration(seconds: 4), () {
      hide();
    });
  }

  static void hide() {
    _currentSnackBar?._timer?.cancel(); // Cancel the timer if snackbar is manually closed
    _currentSnackBar?._overlayEntry.remove();
    _currentSnackBar = null;
  }

  static SnackBar? _currentSnackBar;

  void displaySnackBar(BuildContext context) {
    hide(); // Hide the existing snackbar if present
    _currentSnackBar = this;
    _currentSnackBar!.show(context);
  }
}

// Define the global snackBar function
void snackBar({required BuildContext context, required bool success, required String message}) {
  SnackBar(success: success, context: context, message: message).displaySnackBar(context);
}
