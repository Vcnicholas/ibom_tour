import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class Indicators extends StatelessWidget {
  final int initial;
  final int current;
  const Indicators({super.key, required this.initial, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(initial, (int index) {
          return Container(
            width: current == index ? 10.sp : 4.sp,
            height: 4.sp,
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: current == index ? ColorValues.primaryColor : Colors.black,
            ),
          );
        }));
  }
}