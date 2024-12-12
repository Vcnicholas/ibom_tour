import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ibom_tour/constants/assets.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/pages/dashboard/bar_item.dart';
import 'package:ibom_tour/pages/dashboard/dashboard_vm.dart';

/* The Custom Navigation Bars */
// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  //handles the state changes
  final ValueChanged<int> onItemSelected;

  int selectedIndex;

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  late ScrollController scrollController;
  //handles selections between the screens
  void handleItemSelected(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  double barIconHeight = 8.sp;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavViewModel>(
        builder: (model) => Container(
              padding: EdgeInsets.only(right: 8.sp, left: 8.sp, bottom: 1.sp),
              decoration: const BoxDecoration(),
              // color:  AppColor.blacks,
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: NavigationBarItem(
                                label: "Home",
                                icon: Image.asset(AssetValues.home,
                                    height: widget.selectedIndex == 0
                                        ? 12.sp
                                        : 10.sp,
                                    color: widget.selectedIndex == 0
                                        ? ColorValues.primaryColor
                                        : ColorValues.grayColor),
                                isSelected: (widget.selectedIndex == 0),
                                index: 0,
                                onTap: handleItemSelected, isBold: widget.selectedIndex == 0 ? true: false,
                              ),
                            ),
                            NavigationBarItem(
                              label: "Services",
                              icon: Image.asset(AssetValues.services,
                                  height: widget.selectedIndex == 1
                                      ? 10.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 1
                                      ? ColorValues.primaryColor
                                      : ColorValues.grayColor),
                              isSelected: (widget.selectedIndex == 1),
                              index: 1,
                              onTap: handleItemSelected, isBold: widget.selectedIndex == 1 ? true: false,
                            ),
                            NavigationBarItem(
                              label: "Premium",
                              icon: Image.asset(AssetValues.premium,
                                  height: widget.selectedIndex == 2
                                      ? 10.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 2
                                      ? ColorValues.primaryColor
                                      : ColorValues.grayColor),
                              isSelected: (widget.selectedIndex == 2),
                              index: 2,
                              onTap: handleItemSelected, isBold: widget.selectedIndex == 2? true: false,
                            ),
                            NavigationBarItem(
                              label: "Rewards",
                              icon: Image.asset(AssetValues.rewards,
                                  height: widget.selectedIndex == 3
                                      ? 10.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 3
                                      ? ColorValues.primaryColor
                                      : ColorValues.grayColor),
                              isSelected: (widget.selectedIndex == 3),
                              index: 3,
                              onTap: handleItemSelected, isBold: widget.selectedIndex == 3? true : false,
                            ),
                            NavigationBarItem(
                              label: "Profile",
                              icon: Image.asset(AssetValues.profiles,
                                  height: widget.selectedIndex == 4
                                      ? 10.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 4
                                      ? ColorValues.primaryColor
                                      : ColorValues.grayColor),
                              isSelected: (widget.selectedIndex == 4),
                              index: 4,
                              onTap: handleItemSelected, isBold: widget.selectedIndex == 4 ? true: false,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ));
  }
}
