import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_widgets/app_button.dart';

import '../../../../../../app_widgets/app_input.dart';
import '../../../../../../app_widgets/app_texts.dart';
import '../../../../../../app_widgets/unfocus_widget.dart';
import '../controllers/profiile_controller.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (model) => UnFocusWidget(
        child: Container(
          child: Scaffold(
            appBar: AppBar(title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Profile Information', weight: FontWeight.w700, size: 16.sp,),
              ],
            ), centerTitle: true,),
            body: Container(
              margin: EdgeInsets.only(
                top: 40,
                left: 15,
                right: 15,
              ),
              child: ListView(
                children: [
                  Container(height: 600.sp,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Gap(20.sp),
                       AppInputField(hintText: 'hello', topLabel: 'Full Name',),
                          Gap(5.sp),
                          AppInputField(topLabel: 'Email',),
                          Gap(5.sp),
                          AppInputField(topLabel: 'Phone Number',),

                          Gap(20.sp),
                        ],
                      ),
                    ),
                  ),
                  AppButton(onTap: (){}, text: 'Update Profile',),
                  Gap(40.sp)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
