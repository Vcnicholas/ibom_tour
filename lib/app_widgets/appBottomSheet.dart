import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_widgets/unfocus_widget.dart';

class AppBottomSheets extends GetxController {
  static void showBottomSheet(
    BuildContext context, {
    double? initialSize,
    double? minSize,
    double? maxSize,
    Widget? child,
    bool? snap,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Set the desired corner radius
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: initialSize ?? 0.5,
        // snap: snap ?? false,
        // snapSizes: [
        //   minSize ?? 0.25,
        //   minSize == null ? (0.25 + 0.7) / 2 : (minSize + 0.9) / 2,
        //   0.7
        // ],
        minChildSize: minSize ?? 0.25,
        maxChildSize: maxSize ?? .85,
        builder: (_, scrollController) {
          return UnFocusWidget(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
