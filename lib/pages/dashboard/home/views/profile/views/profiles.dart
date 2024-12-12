import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_widgets/app_button.dart';
import 'package:ibom_tour/app_widgets/app_texts.dart';
import 'package:ibom_tour/app_widgets/dialogue.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/pages/dashboard/home/views/profile/controllers/profiile_controller.dart';
import 'package:ibom_tour/routes/routes_management.dart';

import '../../../../../../app_widgets/unfocus_widget.dart';
import '../../../../../../constants/assets.dart';
import '../../../../../../constants/widget_extension.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (model) => UnFocusWidget(
        child: Container(
          child: Scaffold(
            body: Container(
              margin: EdgeInsets.only(
                top: 40,
                left: 15,
                right: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back Icon
                    Row(
                      children: [
                        InkWell(onTap: (){RouteManagement.goToBack();},
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20.sp,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? ColorValues.whiteColor
                                : ColorValues.blackColor,
                          ),
                        ),
                      ],
                    ),
                    Gap(10.sp),

                    // Profile Picture
                    CircleAvatar(
                      radius: 30.sp,
                      backgroundColor: ColorValues.primaryColor,
                    ),
                    Gap(5.sp),

                    // Profile Name
                    AppText(
                      'Victor Nicholas',
                      size: 20.sp,
                      weight: FontWeight.w700,
                    ),
                    Gap(5.sp),

                    // Profile Email
                    AppText('vcnicholas982@gmail.com'),
                    Gap(20.sp),

                    // Upgrade Account Button
                    Container(
                      height: 42.sp,
                      width: width(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color: ColorValues.primaryColor.withOpacity(.2),
                      ),
                      child: Center(
                        child: AppText('Upgrade Account'),
                      ),
                    ),
                    Gap(30.sp),

                    // General Settings Section
                    Row(
                      children: [
                        AppText(
                          'General Settings',
                          size: 16.sp,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Gap(20.sp),
                    Column(
                      children: List.generate(
                        model.generalSettings.length,
                            (index) => GestureDetector(
                              onTap: (){
                                Get.to(() => model.generalScreens[index]);
                                },
                              child: Column(
                                children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        model.generalIcons[index],
                                        height: 24.sp,
                                        color: ColorValues.primaryColor,
                                      ),
                                      Gap(10.sp),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            model.generalSettings[index],
                                            size: 14.sp,
                                            weight: FontWeight.w500,
                                          ),
                                          AppText(model.generalDesc[index], size: 11.sp,)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16.sp,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? ColorValues.whiteColor
                                        : ColorValues.blackColor,
                                  ),
                                ],
                              ),
                              Gap(20.sp)
                                                        ]),
                            ),
                      ),
                    ),

                    // Security Section
                    Row(
                      children: [
                        AppText(
                          'Security',
                          weight: FontWeight.w700,
                          size: 16.sp,
                        ),
                      ],
                    ),
                    Gap(20.sp),
                    Column(
                      children: List.generate(
                        model.security.length,
                            (index) => GestureDetector(
                              onTap: (){
                                index == 3 ? null: index == 1?
                                CustomDialog.showAlertdialog(context, Container(height: 400.sp, width: width(context),
                                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Image.asset(AssetValues.success, height: 50.sp,),
                                    Gap(10.sp),
                                    AppText('Change Password', size: 20.sp, weight: FontWeight.w700,),
                                    AppText('A reset code will be sent to\nvcnicholas983@gmail.com to\nproceed with changing your password',
                                    align: TextAlign.center,
                                    size: 12.sp, weight: FontWeight.w500,),
                                    Gap(10.sp),
                                    AppButton(onTap: (){
                                    }, text: 'Send code',),
                                    Gap(10.sp),
                                    AppButton(onTap: (){
                                      RouteManagement.goToBack();
                                    }, text: 'Cancel',
                                      textColor: ColorValues.blackColor,
                                    backGroundColor: ColorValues.whiteColor, borderColor: ColorValues.blackColor20,
                                    )
                                  ],),
                                )):
                                Get.to(() => model.securityScreens[index]);
                              },
                              child: Column(
                                children: [
                                  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        model.securityIcons[index],
                                        height: 24.sp,
                                        color: ColorValues.primaryColor,
                                      ),
                                      Gap(5.sp),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            model.security[index],
                                            weight: FontWeight.w500,
                                            size: 14.sp,
                                          ),
                                          AppText(model.securityDesc[index], size: 11.sp,)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: index == 3?
                                    Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Transform.scale(
                                          scale: .7.sp,
                                          child: Switch(
                                            value: model.isSwitched,
                                            onChanged: (value) async {
                                              model.isSwitched = value;
                                              if (value) {
                                                await model.authenticate();  // Trigger authentication when switched on
                                                if (!model.isAuthenticated.value) {
                                                  model.isSwitched = false;  // Reset switch if authentication fails
                                                }
                                              }
                                              model.update();
                                            },
                                            activeColor: ColorValues.whiteColor,
                                            activeTrackColor: ColorValues.primaryColor,
                                            inactiveThumbColor: ColorValues.whiteColor,
                                            inactiveTrackColor: ColorValues.darkerGrayColor.withOpacity(.75),
                                          ),
                                        ),
                                      ],
                                    ):
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16.sp,
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? ColorValues.whiteColor
                                          : ColorValues.blackColor,
                                    )
                                  ),
                                ],
                              ),
                              Gap(index == 2 ? 12.sp: 20.sp),
                                                        ],
                                                      ),),
                      ),
                    ),
                    Row(
                      children: [
                        AppText(
                          'Support & Legal',
                          weight: FontWeight.w700,
                          size: 16.sp,
                        ),
                      ],
                    ),
                    Gap(20.sp),
                    Column(
                      children: List.generate(
                        model.supportLegal.length,
                            (index) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      model.supportLegalIcons[index],
                                      height: 24.sp,
                                      color: ColorValues.primaryColor,
                                    ),
                                    Gap(10.sp),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          model.supportLegal[index],
                                          size: 14.sp,
                                          weight: FontWeight.w500,
                                        ),
                                        AppText(model.supportDesc[index], size: 11.sp,)
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16.sp,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? ColorValues.whiteColor
                                      : ColorValues.blackColor,
                                ),
                              ],
                            ),
                            Gap(20.sp),
                          ],
                        ),
                      ),
                    ),
                    Gap(40.sp),

                    // Logout Button (shows result of authentication)
                           AppButton(
                        onTap: () {},
                        text:'Logout',
                      ),

                    Gap(10.sp),

                    // Close Account Button
                    AppButton(
                      onTap: () {},
                      text: 'Close Account',
                      isTransparent: true,
                      borderColor: ColorValues.errorColor,
                      textColor: ColorValues.errorColor,
                    ),
                    Gap(40.sp)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
